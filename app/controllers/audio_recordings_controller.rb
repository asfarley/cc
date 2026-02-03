class AudioRecordingsController < ApplicationController
  before_action :set_audio_recording, only: %i[ show edit update destroy ]

  # GET /audio_recordings or /audio_recordings.json
  def index
    @audio_recordings = AudioRecording.all
  end

  # GET /audio_recordings/1 or /audio_recordings/1.json
  def show
  end

  # GET /audio_recordings/new
  def new
    @audio_recording = AudioRecording.new
  end

  # GET /audio_recordings/1/edit
  def edit
  end

  # POST /audio_recordings or /audio_recordings.json
  def create
    @audio_recording = AudioRecording.new(audio_recording_params)

    respond_to do |format|
      if @audio_recording.save
        format.html { redirect_to @audio_recording, notice: "Audio recording was successfully created." }
        format.json { render :show, status: :created, location: @audio_recording }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @audio_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_recordings/1 or /audio_recordings/1.json
  def update
    respond_to do |format|
      if @audio_recording.update(audio_recording_params)
        format.html { redirect_to @audio_recording, notice: "Audio recording was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @audio_recording }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @audio_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_recordings/1 or /audio_recordings/1.json
  def destroy
    @audio_recording.destroy!

    respond_to do |format|
      format.html { redirect_to audio_recordings_path, notice: "Audio recording was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording
      @audio_recording = AudioRecording.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def audio_recording_params
      params.expect(audio_recording: [ :device_id, :command_id, :recorded_at, :duration_seconds, :audio ])
    end
end
