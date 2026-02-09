// Devices page initialization
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
  
  // Map initialization handled by device-map Stimulus controller
  
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

// Initialize on both full page load and Turbo navigation
document.addEventListener('DOMContentLoaded', initializeDevicesPage);
document.addEventListener('turbo:load', initializeDevicesPage);

export { initializeDevicesPage };
