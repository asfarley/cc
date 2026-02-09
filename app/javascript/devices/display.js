  export function setBattery(percent,battery_num,device_id) {
    var selector = '#battery'+battery_num+'_'+device_id+' .segment';
    const segments = document.querySelectorAll(selector);
    const filled = Math.ceil(percent / 25);
    segments.forEach((seg, i) => {
      seg.style.background = i < filled ? 'green' : 'lightgray';
    });
  }
