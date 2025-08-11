  export function setBattery(percent,battery_num,device_id) {
    console.log("Percent: %" + percent + " Battery: " + battery_num + " ID: " + device_id);
    var selector = '#battery'+battery_num+'_'+device_id+' .segment';
    console.log("selector: " + selector)
    const segments = document.querySelectorAll(selector);
    console.log("Segments: " + segments.length);
    const filled = Math.ceil(percent / 25);
    segments.forEach((seg, i) => {
      seg.style.background = i < filled ? 'green' : 'lightgray';
    });
  }
