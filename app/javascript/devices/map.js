// Device map functionality
export function initializeDevicesMap(deviceData) {
  // Create a single map for all devices
  var map = L.map('all_devices_map');
  
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);
  
  var markers = [];
  var bounds = L.latLngBounds();
  
  // Add markers for each device with location data
  deviceData.forEach(function(device) {
    if (device.lat && device.lng) {
      var latlng = L.latLng(device.lat, device.lng);
      
      // Add marker for this device
      var marker = L.marker(latlng).addTo(map);
      marker.bindPopup("<b>" + device.name + "</b><br>Lat: " + device.lat + "<br>Lng: " + device.lng);
      
      // Store marker and extend bounds
      markers.push(marker);
      bounds.extend(latlng);
    }
  });
  
  // If we have any markers, fit the map to show all of them
  if (markers.length > 0) {
    map.fitBounds(bounds, { padding: [50, 50] });
  } else {
    // Default view if no markers
    map.setView([0, 0], 2);
  }
}