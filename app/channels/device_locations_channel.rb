class DeviceLocationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "device_locations"
  end

  def unsubscribed
    # Cleanup when channel is unsubscribed
  end
end
