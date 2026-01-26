import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Device map controller connected")
    this.markers = {}
    this.initMap()
    this.loadAllDevices()
    
    // Listen for device updates
    window.addEventListener('device-updated', this.handleDeviceUpdate.bind(this))
  }

  disconnect() {
    window.removeEventListener('device-updated', this.handleDeviceUpdate.bind(this))
  }

  initMap() {
    if (!this.map) {
      // Initialize map with default center
      this.map = L.map('all_devices_map').setView([0, 0], 2)
      
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
      }).addTo(this.map)
    }
  }

  loadAllDevices() {
    // Load all devices from the DOM
    const deviceElements = document.querySelectorAll('[data-device-id]')
    const devices = []
    
    deviceElements.forEach(el => {
      const lat = parseFloat(el.dataset.deviceLat)
      const lng = parseFloat(el.dataset.deviceLng)
      
      if (lat && lng && !isNaN(lat) && !isNaN(lng)) {
        const device = {
          id: el.dataset.deviceId,
          name: el.dataset.deviceName,
          lat: lat,
          lng: lng,
          battery1_percent: el.dataset.deviceBattery1,
          battery2_percent: el.dataset.deviceBattery2
        }
        devices.push(device)
        this.addOrUpdateMarker(device)
      }
    })
    
    // Fit bounds if we have markers
    if (Object.keys(this.markers).length > 0) {
      const group = L.featureGroup(Object.values(this.markers))
      this.map.fitBounds(group.getBounds().pad(0.1))
    }
  }

  handleDeviceUpdate(event) {
    const device = event.detail
    if (device.lat && device.lng && !isNaN(device.lat) && !isNaN(device.lng)) {
      this.addOrUpdateMarker(device)
    }
  }

  addOrUpdateMarker(device) {
    // Remove existing marker if it exists
    if (this.markers[device.id]) {
      this.markers[device.id].remove()
    }
    
    // Create new marker
    const marker = L.marker([device.lat, device.lng])
      .addTo(this.map)
      .bindPopup(`
        <b>${device.name}</b><br>
        Battery 1: ${device.battery1_percent || 'N/A'}%<br>
        Battery 2: ${device.battery2_percent || 'N/A'}%
      `)
    
    this.markers[device.id] = marker
  }
}
