# Test Scenario for Device Update Fix

## Setup
1. Ensure Rails server is running
2. Open the devices index page in a browser
3. Ensure at least one device exists in the system

## Test Case: New DeviceState Creation
### Steps:
1. Open the devices index page (`http://localhost:3000/devices`)
2. Keep the page open to observe live updates
3. Send a POST request to create a new DeviceState for an existing device:

```bash
# Example using curl (adjust token and device_id as needed)
curl -X POST http://localhost:3000/device_states \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{
    "device_state": {
      "Device_id": 1,
      "battery1_percent": 85.0,
      "battery1_v": 24.5,
      "latitude1": 51.0475,
      "longitude1": -114.068889,
      "armed": false,
      "mode": "MANUAL"
    }
  }'
```

### Expected Result:
The device section on the index page should update **completely** showing:
- ✅ Status line with LED indicator (green if recent, gray if old)
- ✅ Device name as a link
- ✅ Battery icon with percentage on the right
- ✅ Latest photograph (if available) or "Image unavailable" placeholder
- ✅ "Logs and Diagnostics" expandable section with full DeviceState details

### Previous Buggy Behavior:
The device section would sometimes only show:
- ❌ Missing status line
- ❌ Missing photograph section
- ✅ Only the "Logs and Diagnostics" section visible

## Verification Points:
1. **Check browser console** - Should see Turbo Stream update message
2. **Inspect DOM** - The `div#device_X` should contain all expected elements:
   - `<p>` with summaryline (LED + device link + battery icon)
   - Photograph div or placeholder
   - DeviceState details section
3. **Test multiple times** - Issue was intermittent, so test 5-10 times
4. **Check database** - Verify device.state_id points to the latest DeviceState:
   ```ruby
   rails console
   > device = Device.first
   > device.state_id  # Should match the latest DeviceState ID
   > device.state     # Should return the latest DeviceState object
   ```

## Additional Test: Update Existing DeviceState
### Steps:
1. Update an existing DeviceState via PATCH
2. Verify the device section updates completely

### Expected Result:
Same as above - complete device section with all elements visible.
