import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        if (mutation.type === 'childList') {
          const addedNodes = Array.from(mutation.addedNodes)
          addedNodes.forEach((node) => {
            if (node.nodeType === Node.ELEMENT_NODE) {
              const img = node.tagName === 'IMG' ? node : node.querySelector('img')
              if (img) {
                this.preloadAndSwap(img)
              }
            }
          })
        }
      })
    })

    this.observer.observe(this.element, {
      childList: true,
      subtree: true
    })
  }

  disconnect() {
    if (this.observer) {
      this.observer.disconnect()
    }
  }

  preloadAndSwap(newImg) {
    const newSrc = newImg.src
    const targetDiv = this.element.querySelector('[id$="_photograph_img"]')
    const currentImg = targetDiv?.querySelector('img.photograph')
    
    if (!currentImg || currentImg.src === newSrc) {
      return
    }

    // Preload the image
    const preloader = new Image()
    preloader.onload = () => {
      // Once loaded, swap the src
      currentImg.src = newSrc
      // Remove the new img element that was added by Turbo Stream
      newImg.remove()
    }
    preloader.onerror = () => {
      // On error, fall back to direct replacement
      currentImg.src = newSrc
      newImg.remove()
    }
    preloader.src = newSrc
  }

  loadComplete(event) {
    // Optional: handle load complete events if needed
  }
}
