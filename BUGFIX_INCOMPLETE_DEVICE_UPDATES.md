# Bug Fix: Incomplete Device Section Updates

## Problem
The Device section in the index view (`/app/views/devices/index.html.erb`) would sometimes show only the DeviceState partial instead of the complete status line and latest image when live-updating after receiving a new DeviceState.

## Root Cause
The issue was a race condition in the order of operations when creating a new DeviceState:

### Original Flow (Broken):
1. `DeviceState.new()` creates an unsaved DeviceState (no ID yet)
2. `device.state = @device_state` assigns the unsaved DeviceState to the device
3. `device.save` saves the device with `state_id = nil` (because DeviceState has no ID)
4. `@device_state.save` saves the DeviceState and assigns it an ID
5. `after_commit` callback fires and triggers `broadcast_update`
6. `broadcast_update` reloads the device from the database
7. The reloaded device has `state_id = nil`, so `device.state` is `nil`
8. The partial renders with incomplete data (no summaryline, no photograph, only DeviceState details)

## Solution
Two complementary fixes were implemented:

### Fix 1: Reorder Operations in DeviceStatesController
**File**: `/app/controllers/device_states_controller.rb`

Changed the `create` action to save the DeviceState BEFORE updating the Device's state reference:

```ruby
def create
  @device_state = DeviceState.new(device_state_params)
  device = Device.find(filtered_params[:Device_id])

  respond_to do |format|
    if @device_state.save
      # Update AFTER save so DeviceState has an ID
      device.state = @device_state
      device.save
      
      format.html { redirect_to @device_state, notice: "Device state was successfully created." }
      format.json { render :show, status: :created, location: @device_state }
    else
      # ... error handling
    end
  end
end
```

### Fix 2: Ensure state_id is Updated Before Broadcasting
**File**: `/app/models/device_state.rb`

Added a safeguard in the `broadcast_update` callback to ensure the device's `state_id` is updated before broadcasting:

```ruby
def broadcast_update
  device = Device.find_by(state_id: self.id)
  device ||= Device.find_by(id: self.Device_id) if self.Device_id.present?
  
  if device
    # Ensure the device's state_id points to this state
    if device.state_id != self.id
      device.update_column(:state_id, self.id)
    end
    
    # Reload and broadcast
    device = Device.includes(:state, :photographs).find(device.id)
    broadcast_replace_to("devices", target: "device_#{device.id}", ...)
  end
end
```

## Why This Works
1. The DeviceState is saved first and gets an ID
2. The broadcast callback fires
3. The callback ensures `device.state_id` is updated in the database
4. The device is reloaded with the correct state association
5. The view renders with complete data: summaryline, photograph, and DeviceState details

## Testing
To verify the fix works:
1. Send a new DeviceState via the API
2. Observe the live-update in the devices index view
3. Confirm that the device section shows:
   - Status line with LED indicator, device name, and battery icon
   - Latest photograph (if available)
   - DeviceState details in the expandable section

The device section should now always update completely, never showing just the DeviceState partial.
