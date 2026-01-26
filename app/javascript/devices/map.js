// Device map functionality
let mapInstance = null;
let markersById = {};

export function initializeDevicesMap(deviceData) {
  // Create a single map for all devices
  mapInstance = L.map('all_devices_map');
  
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(mapInstance);
  
  var markers = [];
  var bounds = L.latLngBounds();
  
  // Add markers for each device with location data
  deviceData.forEach(function(device) {
    if (device.lat && device.lng) {
      var latlng = L.latLng(device.lat, device.lng);
      
      // Add marker for this device
      var marker = L.marker(latlng).addTo(mapInstance);
      marker.bindPopup("<b>" + device.name + "</b><br>Lat: " + device.lat + "<br>Lng: " + device.lng + "<br>Battery 1: " + (device.battery1_percent || 'N/A') + "%<br>Battery 2: " + (device.battery2_percent || 'N/A') + "%");
      
      // Store marker by device ID
      markersById[device.id] = marker;
      markers.push(marker);
      bounds.extend(latlng);
    }
  });
  
  // If we have any markers, fit the map to show all of them
  if (markers.length > 0) {
    mapInstance.fitBounds(bounds, { padding: [50, 50] });
  } else {
    // Default view if no markers
    mapInstance.setView([0, 0], 2);
  }
}

// Update a single device's marker on the map
export function updateDeviceMarker(deviceId, deviceData) {
  if (!mapInstance) return;
  
  // Remove old marker if it exists
  if (markersById[deviceId]) {
    markersById[deviceId].remove();
  }
  
  // Add new marker if we have location data
  if (deviceData.lat && deviceData.lng) {
    var latlng = L.latLng(deviceData.lat, deviceData.lng);
    var marker = L.marker(latlng).addTo(mapInstance);
    marker.bindPopup("<b>" + deviceData.name + "</b><br>Lat: " + deviceData.lat + "<br>Lng: " + deviceData.lng + "<br>Battery 1: " + (deviceData.battery1_percent || 'N/A') + "%<br>Battery 2: " + (deviceData.battery2_percent || 'N/A') + "%");
    markersById[deviceId] = marker;
  }
}