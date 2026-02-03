require "application_system_test_case"

class AudioRecordingsTest < ApplicationSystemTestCase
  setup do
    @audio_recording = audio_recordings(:one)
  end

  test "visiting the index" do
    visit audio_recordings_url
    assert_selector "h1", text: "Audio recordings"
  end

  test "should create audio recording" do
    visit audio_recordings_url
    click_on "New audio recording"

    fill_in "Command", with: @audio_recording.command_id
    fill_in "Device", with: @audio_recording.device_id
    fill_in "Duration seconds", with: @audio_recording.duration_seconds
    fill_in "Recorded at", with: @audio_recording.recorded_at
    click_on "Create Audio recording"

    assert_text "Audio recording was successfully created"
    click_on "Back"
  end

  test "should update Audio recording" do
    visit audio_recording_url(@audio_recording)
    click_on "Edit this audio recording", match: :first

    fill_in "Command", with: @audio_recording.command_id
    fill_in "Device", with: @audio_recording.device_id
    fill_in "Duration seconds", with: @audio_recording.duration_seconds
    fill_in "Recorded at", with: @audio_recording.recorded_at.to_s
    click_on "Update Audio recording"

    assert_text "Audio recording was successfully updated"
    click_on "Back"
  end

  test "should destroy Audio recording" do
    visit audio_recording_url(@audio_recording)
    click_on "Destroy this audio recording", match: :first

    assert_text "Audio recording was successfully destroyed"
  end
end
