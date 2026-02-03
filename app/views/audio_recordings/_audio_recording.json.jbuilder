json.extract! audio_recording, :id, :device_id, :command_id, :recorded_at, :duration_seconds, :created_at, :updated_at
json.url audio_recording_url(audio_recording, format: :json)
