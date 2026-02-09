import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const deviceData = {
      id: this.element.dataset.deviceId,
      name: this.element.dataset.deviceName,
      lat: parseFloat(this.element.dataset.deviceLat),
      lng: parseFloat(this.element.dataset.deviceLng),
      battery1_percent: this.element.dataset.deviceBattery1,
      battery2_percent: this.element.dataset.deviceBattery2
    }
    
    // Only dispatch if we have valid coordinates
    if (!isNaN(deviceData.lat) && !isNaN(deviceData.lng) && deviceData.lat && deviceData.lng) {
      const event = new CustomEvent('device-updated', {
        detail: deviceData
      })
      window.dispatchEvent(event)
    }
  }
}
