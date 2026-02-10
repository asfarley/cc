import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  connect() {
    this.markersById = new Map()
    this.initMap()
    this.loadAllDevices()
    this.subscribeToUpdates()
  }

  disconnect() {
    if (this.subscription) {
      this.subscription.unsubscribe()
    }
  }

  initMap() {
    const container = L.DomUtil.get('all_devices_map')
    if (container && container._leaflet_id) {
      container._leaflet_id = null
    }
    
    this.map = L.map('all_devices_map').setView([0, 0], 2)
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(this.map)
  }

  loadAllDevices() {
    const deviceElements = document.querySelectorAll('.device-card[data-device-id]')
    
    deviceElements.forEach(el => {
      const lat = parseFloat(el.dataset.deviceLat)
      const lng = parseFloat(el.dataset.deviceLng)
      
      if (!isNaN(lat) && !isNaN(lng)) {
        const data = {
          id: parseInt(el.dataset.deviceId),
          name: el.dataset.deviceName,
          lat,
          lng,
          battery1_percent: parseFloat(el.dataset.deviceBattery1) || 0,
          battery2_percent: parseFloat(el.dataset.deviceBattery2) || 0
        }
        this.updateMarker(data)
      }
    })
    
    if (this.markersById.size > 0) {
      const group = L.featureGroup([...this.markersById.values()])
      this.map.fitBounds(group.getBounds().pad(0.1))
    }
  }

  subscribeToUpdates() {
    this.subscription = consumer.subscriptions.create("DeviceLocationsChannel", {
      received: (data) => {
        this.updateMarker(data)
      }
    })
  }

  updateMarker(data) {
    const { id, name, lat, lng, battery1_percent, battery2_percent } = data
    
    if (!id || isNaN(lat) || isNaN(lng)) return
    
    const marker = this.markersById.get(id)
    
    if (marker) {
      // Update existing marker position
      marker.setLatLng([lat, lng])
      marker.getPopup().setContent(`
        <b>${name}</b><br>
        Battery 1: ${battery1_percent || 'N/A'}%<br>
        Battery 2: ${battery2_percent || 'N/A'}%
      `)
    } else {
      // Create new marker
      const newMarker = L.marker([lat, lng])
        .addTo(this.map)
        .bindPopup(`
          <b>${name}</b><br>
          Battery 1: ${battery1_percent || 'N/A'}%<br>
          Battery 2: ${battery2_percent || 'N/A'}%
        `)
      this.markersById.set(id, newMarker)
    }
  }
}
