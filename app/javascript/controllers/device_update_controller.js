import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Notify the map controller that a device was updated
    const event = new CustomEvent('device-updated', {
      detail: {
        id: this.element.dataset.deviceId,
        name: this.element.dataset.deviceName,
        lat: parseFloat(this.element.dataset.deviceLat),
        lng: parseFloat(this.element.dataset.deviceLng),
        battery1_percent: this.element.dataset.deviceBattery1,
        battery2_percent: this.element.dataset.deviceBattery2
      }
    })
    window.dispatchEvent(event)
  }
}
