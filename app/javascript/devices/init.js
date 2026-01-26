// Devices page initialization
import { initializeDevicesMap, updateDeviceMarker } from "devices/map";
import { initializeGamepadHandler } from "devices/controller";
import { setBattery } from "devices/display";

function initializeDevicesPage() {
  // Check if we're on the devices page
  const mapElement = document.getElementById('all_devices_map');
  if (!mapElement) {
    return; // Not on devices page, skip initialization
  }

  // Get device data from data attribute
  const devicesContainer = document.getElementById('devices');
  if (!devicesContainer) {
    return;
  }

  const deviceDataStr = devicesContainer.getAttribute('data-devices');
  if (!deviceDataStr) {
    console.log('No device data found');
    return;
  }

  const deviceData = JSON.parse(deviceDataStr);
  
  // Initialize map with device data
  initializeDevicesMap(deviceData);
  
  // Initialize game controller handler
  initializeGamepadHandler();
  
  // Initialize battery displays
  deviceData.forEach(device => {
    if (device.battery1_percent !== undefined) {
      setBattery(device.battery1_percent, 1, device.id);
    }
    if (device.battery2_percent !== undefined) {
      setBattery(device.battery2_percent, 2, device.id);
    }
  });
}

// Handle Turbo Stream updates to device cards
function handleDeviceUpdate(event) {
  // Wait a tick for the DOM to update
  setTimeout(() => {
    // Find the updated device element
    const deviceElements = document.querySelectorAll('[data-device-id]');
    
    deviceElements.forEach(el => {
      const deviceId = el.dataset.deviceId;
      const lat = parseFloat(el.dataset.deviceLat);
      const lng = parseFloat(el.dataset.deviceLng);
      
      if (lat && lng && !isNaN(lat) && !isNaN(lng)) {
        const deviceData = {
          id: deviceId,
          name: el.dataset.deviceName,
          lat: lat,
          lng: lng,
          battery1_percent: el.dataset.deviceBattery1,
          battery2_percent: el.dataset.deviceBattery2
        };
        
        // Update the marker on the map
        updateDeviceMarker(deviceId, deviceData);
        
        // Update battery displays
        if (deviceData.battery1_percent !== undefined) {
          setBattery(deviceData.battery1_percent, 1, deviceId);
        }
        if (deviceData.battery2_percent !== undefined) {
          setBattery(deviceData.battery2_percent, 2, deviceId);
        }
      }
    });
  }, 100);
}

// Initialize on both full page load and Turbo navigation
document.addEventListener('DOMContentLoaded', initializeDevicesPage);
document.addEventListener('turbo:load', initializeDevicesPage);

// Listen for Turbo Stream renders (live updates)
document.addEventListener('turbo:before-stream-render', handleDeviceUpdate);

export { initializeDevicesPage };
