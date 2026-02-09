import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.markers = {}
    this.initMap()
    this.loadAllDevices()
    
    // Listen for device updates
    this.boundHandler = this.handleDeviceUpdate.bind(this)
    window.addEventListener('device-updated', this.boundHandler)
  }

  disconnect() {
    window.removeEventListener('device-updated', this.boundHandler)
  }

  initMap() {
    const container = L.DomUtil.get('all_devices_map')
    
    // If container already has a map, remove it first
    if (container && container._leaflet_id) {
      container._leaflet_id = null
    }
    
    if (!this.map || !this.map._container) {
      this.map = L.map('all_devices_map').setView([0, 0], 2)
      
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
      }).addTo(this.map)
    }
  }

  loadAllDevices() {
    // Load all devices from the DOM - target only device cards, not nested elements
    const deviceElements = document.querySelectorAll('.device-card[data-device-id]')
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
    
    console.log('[MAP] Loaded', devices.length, 'devices on initial load')
    
    // Fit bounds if we have markers
    if (Object.keys(this.markers).length > 0) {
      const group = L.featureGroup(Object.values(this.markers))
      this.map.fitBounds(group.getBounds().pad(0.1))
    }
  }

  handleDeviceUpdate(event) {
    const device = event.detail
    
    console.log('[MAP] Device update received:', device)
    
    if (device.lat && device.lng && !isNaN(device.lat) && !isNaN(device.lng)) {
      console.log('[MAP] Valid coordinates, updating marker')
      this.addOrUpdateMarker(device)
      this.fitBoundsToMarkers()
    } else {
      console.log('[MAP] Invalid coordinates, skipping')
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

  fitBoundsToMarkers() {
    const markerValues = Object.values(this.markers)
    
    console.log('[MAP] fitBoundsToMarkers called, marker count:', markerValues.length)
    
    if (markerValues.length === 0) {
      console.log('[MAP] No markers to fit')
      return
    }
    
    if (markerValues.length === 1) {
      // Single marker: center on it with reasonable zoom
      const latlng = markerValues[0].getLatLng()
      console.log('[MAP] Single marker, setting view to:', latlng)
      this.map.setView(latlng, 13, { animate: true })
    } else {
      // Multiple markers: fit bounds with padding
      const group = L.featureGroup(markerValues)
      const bounds = group.getBounds()
      console.log('[MAP] Multiple markers, fitting bounds:', bounds)
      this.map.fitBounds(bounds.pad(0.1), { animate: true })
    }
  }
}
