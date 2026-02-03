require "test_helper"

class VideoRecordingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video_recording = video_recordings(:one)
  end

  test "should get index" do
    get video_recordings_url
    assert_response :success
  end

  test "should get new" do
    get new_video_recording_url
    assert_response :success
  end

  test "should create video_recording" do
    assert_difference("VideoRecording.count") do
      post video_recordings_url, params: { video_recording: {} }
    end

    assert_redirected_to video_recording_url(VideoRecording.last)
  end

  test "should show video_recording" do
    get video_recording_url(@video_recording)
    assert_response :success
  end

  test "should get edit" do
    get edit_video_recording_url(@video_recording)
    assert_response :success
  end

  test "should update video_recording" do
    patch video_recording_url(@video_recording), params: { video_recording: {} }
    assert_redirected_to video_recording_url(@video_recording)
  end

  test "should destroy video_recording" do
    assert_difference("VideoRecording.count", -1) do
      delete video_recording_url(@video_recording)
    end

    assert_redirected_to video_recordings_url
  end
end
