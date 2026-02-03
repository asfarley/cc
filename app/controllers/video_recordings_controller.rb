class VideoRecordingsController < ApplicationController
  before_action :set_video_recording, only: %i[ show edit update destroy ]

  # GET /video_recordings or /video_recordings.json
  def index
    @video_recordings = VideoRecording.all
  end

  # GET /video_recordings/1 or /video_recordings/1.json
  def show
  end

  # GET /video_recordings/new
  def new
    @video_recording = VideoRecording.new
  end

  # GET /video_recordings/1/edit
  def edit
  end

  # POST /video_recordings or /video_recordings.json
  def create
    @video_recording = VideoRecording.new(video_recording_params)

    respond_to do |format|
      if @video_recording.save
        format.html { redirect_to @video_recording, notice: "Video recording was successfully created." }
        format.json { render :show, status: :created, location: @video_recording }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_recordings/1 or /video_recordings/1.json
  def update
    respond_to do |format|
      if @video_recording.update(video_recording_params)
        format.html { redirect_to @video_recording, notice: "Video recording was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @video_recording }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_recordings/1 or /video_recordings/1.json
  def destroy
    @video_recording.destroy!

    respond_to do |format|
      format.html { redirect_to video_recordings_path, notice: "Video recording was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_recording
      @video_recording = VideoRecording.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def video_recording_params
      params.require(:video_recording).permit(:device_id, :command_id, :recorded_at, :duration_seconds, :video)
    end
end
