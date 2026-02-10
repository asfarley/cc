import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Small delay to ensure DOM updates have completed
    requestAnimationFrame(() => {
      const deviceId = this.element.dataset.deviceId
      const deviceName = this.element.dataset.deviceName
      const lat = parseFloat(this.element.dataset.deviceLat)
      const lng = parseFloat(this.element.dataset.deviceLng)
      const battery1 = this.element.dataset.deviceBattery1
      const battery2 = this.element.dataset.deviceBattery2
      
      // Find the device card and update its data attributes
      const deviceCard = document.querySelector(`[data-device-id="${deviceId}"].device-card`)
      if (deviceCard && lat && lng && !isNaN(lat) && !isNaN(lng)) {
        deviceCard.dataset.deviceLat = lat
        deviceCard.dataset.deviceLng = lng
        deviceCard.dataset.deviceBattery1 = battery1
        deviceCard.dataset.deviceBattery2 = battery2
        
        console.log('[device-update] Updated device card attributes and dispatching event', {
          id: deviceId, name: deviceName, lat, lng, battery1, battery2
        })
        
        const event = new CustomEvent('device-updated', {
          detail: {
            id: deviceId,
            name: deviceName,
            lat: lat,
            lng: lng,
            battery1_percent: battery1,
            battery2_percent: battery2
          },
          bubbles: true
        })
        window.dispatchEvent(event)
      } else {
        console.log('[device-update] Skipping - invalid coords or card not found', {
          deviceId, lat, lng, cardFound: !!deviceCard
        })
      }
    })
  }
}
