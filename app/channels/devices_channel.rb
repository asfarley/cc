class DevicesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "devices"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
