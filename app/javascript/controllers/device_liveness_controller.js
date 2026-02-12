import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["summary"]
  static values = {
    deviceId: Number,
    updateInterval: { type: Number, default: 5000 }
  }

  connect() {
    this.lastTelemetryAt = null
    this.batteryPercent = null
    this.deviceName = null
    
    this.updateLiveness()
    this.startPolling()
    this.startLocalUpdate()
  }

  disconnect() {
    this.stopPolling()
    this.stopLocalUpdate()
  }

  startPolling() {
    this.pollingTimer = setInterval(() => {
      this.updateLiveness()
    }, this.updateIntervalValue)
  }

  stopPolling() {
    if (this.pollingTimer) {
      clearInterval(this.pollingTimer)
    }
  }

  startLocalUpdate() {
    this.localUpdateTimer = setInterval(() => {
      this.renderSummaryFromCache()
    }, 1000)
  }

  stopLocalUpdate() {
    if (this.localUpdateTimer) {
      clearInterval(this.localUpdateTimer)
    }
  }

  async updateLiveness() {
    try {
      const response = await fetch(`/devices/${this.deviceIdValue}/telemetry_status`)
      if (!response.ok) return
      
      const data = await response.json()
      this.lastTelemetryAt = data.last_telemetry_at
      this.batteryPercent = data.battery_percent
      this.deviceName = data.name
      this.renderSummaryFromCache()
    } catch (error) {
      console.error("Failed to fetch device liveness:", error)
    }
  }

  renderSummaryFromCache() {
    if (!this.deviceName) return
    
    const active = this.isActive(this.lastTelemetryAt)
    const timeText = this.formatTimeAgo(this.lastTelemetryAt)
    
    // Update LED image src without replacing entire DOM
    const ledImg = this.summaryTarget.querySelector('img.led')
    if (ledImg) {
      const color = active ? "green" : "black"
      ledImg.src = `/${color}.png`
      ledImg.alt = `LED ${active ? 'green' : 'off'}`
    }
    
    // Update last telemetry text
    const timeSpan = this.summaryTarget.querySelector('span[style*="color: #666"]')
    if (timeSpan) {
      timeSpan.textContent = `Last telemetry: ${timeText}`
    }
    
    // Update device name link if needed (only on first render)
    const nameLink = this.summaryTarget.querySelector('strong a')
    if (nameLink && nameLink.textContent !== this.deviceName) {
      nameLink.textContent = this.deviceName
    }
  }

  isActive(lastTelemetryAt) {
    if (!lastTelemetryAt) return false
    const lastTime = new Date(lastTelemetryAt)
    const tenMinutesAgo = new Date(Date.now() - 10 * 60 * 1000)
    return lastTime >= tenMinutesAgo
  }

  formatTimeAgo(timestamp) {
    if (!timestamp) return "never"
    
    const ms = Date.now() - new Date(timestamp)
    const seconds = Math.floor(ms / 1000)
    
    if (ms < 1000) return `${ms} ms ago`
    if (seconds < 60) return `${seconds} second${seconds === 1 ? '' : 's'} ago`
    
    const minutes = Math.floor(seconds / 60)
    if (minutes < 60) return `${minutes} minute${minutes === 1 ? '' : 's'} ago`
    
    const hours = Math.floor(minutes / 60)
    if (hours < 24) return `${hours} hour${hours === 1 ? '' : 's'} ago`
    
    const days = Math.floor(hours / 24)
    if (days < 30) return `${days} day${days === 1 ? '' : 's'} ago`
    
    const months = Math.floor(days / 30)
    if (months < 12) return `${months} month${months === 1 ? '' : 's'} ago`
    
    const years = Math.floor(months / 12)
    return `${years} year${years === 1 ? '' : 's'} ago`
  }

  renderLED(active) {
    const color = active ? "green" : "black"
    return `<span class="led-wrap" title="">
      <img alt="LED ${active ? 'green' : 'off'}" width="16" height="16" class="led" src="/${color}.png">
    </span>`
  }

  renderBattery(percent) {
    const p = this.clampPercent(percent)
    const segments = 5
    const filled = Math.round((p / 100.0) * segments)
    const filledClamped = Math.max(0, Math.min(filled, segments))
    
    let state = "battery--ok"
    if (p <= 15) state = "battery--crit"
    else if (p <= 35) state = "battery--warn"
    
    const segs = Array.from({ length: segments }, (_, i) => {
      const cssClass = (i < filledClamped) ? "is-filled" : "is-empty"
      return `<span class="battery__seg ${cssClass}" aria-hidden="true"></span>`
    }).join('')
    
    return `<span class="battery battery--md ${state}" role="img" aria-label="Battery: ${p}%" title="Battery: ${p}%" data-percent="${p}">
      <span class="battery__body" aria-hidden="true">${segs}</span>
      <span class="battery__cap" aria-hidden="true"></span>
    </span>`
  }

  clampPercent(value) {
    if (value === null || value === undefined || value === "?") return 0
    const n = parseFloat(value)
    if (isNaN(n) || !isFinite(n)) return 0
    return Math.max(0, Math.min(Math.round(n), 100))
  }

  escapeHtml(text) {
    const div = document.createElement('div')
    div.textContent = text
    return div.innerHTML
  }
}
