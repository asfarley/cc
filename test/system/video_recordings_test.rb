require "application_system_test_case"

class VideoRecordingsTest < ApplicationSystemTestCase
  setup do
    @video_recording = video_recordings(:one)
  end

  test "visiting the index" do
    visit video_recordings_url
    assert_selector "h1", text: "Video recordings"
  end

  test "should create video recording" do
    visit video_recordings_url
    click_on "New video recording"

    click_on "Create Video recording"

    assert_text "Video recording was successfully created"
    click_on "Back"
  end

  test "should update Video recording" do
    visit video_recording_url(@video_recording)
    click_on "Edit this video recording", match: :first

    click_on "Update Video recording"

    assert_text "Video recording was successfully updated"
    click_on "Back"
  end

  test "should destroy Video recording" do
    visit video_recording_url(@video_recording)
    click_on "Destroy this video recording", match: :first

    assert_text "Video recording was successfully destroyed"
  end
end
