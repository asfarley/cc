// Game Controller Input Handler Module
export function initializeGamepadHandler() {
  const lastGameInputElement = document.getElementById('lastGameInput');
  const controllerStatusElement = document.getElementById('controllerStatus');
  let controllers = {};
  
  // Function to update the controller status display
  function updateControllerStatus() {
    const connectedControllers = Object.keys(controllers).length;
    if (connectedControllers === 0) {
      controllerStatusElement.textContent = 'No controller detected';
      controllerStatusElement.className = 'mt-2 text-muted';
    } else {
      controllerStatusElement.textContent = `${connectedControllers} controller${connectedControllers > 1 ? 's' : ''} connected`;
      controllerStatusElement.className = 'mt-2 text-success';
    }
  }
  
  // Function to handle controller connection
  function connectHandler(e) {
    console.log('Controller connected:', e.gamepad);
    controllers[e.gamepad.index] = e.gamepad;
    updateControllerStatus();
    lastGameInputElement.value = `Controller ${e.gamepad.id} connected`;
  }
  
  // Function to handle controller disconnection
  function disconnectHandler(e) {
    console.log('Controller disconnected:', e.gamepad);
    delete controllers[e.gamepad.index];
    updateControllerStatus();
    lastGameInputElement.value = `Controller ${e.gamepad.id} disconnected`;
  }
  
  // Handle new controller detection
  function handleNewController(gamepad) {
    if (!controllers[gamepad.index]) {
      controllers[gamepad.index] = gamepad;
      updateControllerStatus();
    }
  }
  
  // Process button inputs from a gamepad
  function processButtonInputs(gamepad) {
    for (let j = 0; j < gamepad.buttons.length; j++) {
      const button = gamepad.buttons[j];
      if (button.pressed) {
        lastGameInputElement.value = `Button ${j} pressed (value: ${button.value.toFixed(2)})`;
        return true; // Input detected
      }
    }
    return false; // No button input detected
  }
  
  // Process axis inputs from a gamepad
  function processAxisInputs(gamepad) {
    for (let j = 0; j < gamepad.axes.length; j++) {
      const axisValue = gamepad.axes[j];
      if (Math.abs(axisValue) > 0.1) {
        lastGameInputElement.value = `Axis ${j} moved (value: ${axisValue.toFixed(2)})`;
        return true; // Input detected
      }
    }
    return false; // No axis input detected
  }
  
  // Poll for gamepad input
  function pollGamepads() {
    const gamepads = navigator.getGamepads ? navigator.getGamepads() : [];
    
    for (let i = 0; i < gamepads.length; i++) {
      const gamepad = gamepads[i];
      
      if (!gamepad) continue;
      
      // Check if this is a new controller
      handleNewController(gamepad);
      
      // Check for button presses first (priority)
      const buttonInputDetected = processButtonInputs(gamepad);
      
      // Only check for axis movement if no button press was detected
      if (!buttonInputDetected) {
        processAxisInputs(gamepad);
      }
    }
    
    // Continue polling
    requestAnimationFrame(pollGamepads);
  }
  
  // Set up event listeners for controller connection/disconnection
  window.addEventListener("gamepadconnected", connectHandler);
  window.addEventListener("gamepaddisconnected", disconnectHandler);
  
  // Start polling for gamepad input
  requestAnimationFrame(pollGamepads);
}