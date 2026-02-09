import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "videoPanel", "imagePanel", "audioPanel", "metadata", 
    "videoDuration", "videoRecorded", 
    "audioDuration", "audioRecorded",
    "imageRecorded"
  ]

  showVideo(event) {
    this.hideAll()
    this.videoPanelTarget.style.display = "flex"
    event.target.classList.add("active")
    this.updateMetadata("video")
  }

  showImage(event) {
    this.hideAll()
    this.imagePanelTarget.style.display = "flex"
    event.target.classList.add("active")
    this.updateMetadata("image")
  }

  showAudio(event) {
    this.hideAll()
    this.audioPanelTarget.style.display = "flex"
    event.target.classList.add("active")
    this.updateMetadata("audio")
  }

  hideAll() {
    if (this.hasVideoPanelTarget) this.videoPanelTarget.style.display = "none"
    if (this.hasImagePanelTarget) this.imagePanelTarget.style.display = "none"
    if (this.hasAudioPanelTarget) this.audioPanelTarget.style.display = "none"
    
    this.element.querySelectorAll(".btn-group button").forEach(btn => {
      btn.classList.remove("active")
    })
  }

  updateMetadata(type) {
    if (!this.hasMetadataTarget) return

    let text = ""
    
    if (type === "video" && this.hasVideoDurationTarget) {
      const duration = this.videoDurationTarget.textContent.trim()
      const recorded = this.hasVideoRecordedTarget ? this.videoRecordedTarget.textContent.trim() : ""
      text = recorded ? `Recorded: ${recorded}` : ""
      if (duration) text += ` | Duration: ${duration}s`
    } else if (type === "audio" && this.hasAudioDurationTarget) {
      const duration = this.audioDurationTarget.textContent.trim()
      const recorded = this.hasAudioRecordedTarget ? this.audioRecordedTarget.textContent.trim() : ""
      text = recorded ? `Recorded: ${recorded}` : ""
      if (duration) text += ` | Duration: ${duration}s`
    } else if (type === "image" && this.hasImageRecordedTarget) {
      const recorded = this.imageRecordedTarget.textContent.trim()
      text = recorded ? `Recorded: ${recorded}` : ""
    }
    
    this.metadataTarget.textContent = text
  }
}
