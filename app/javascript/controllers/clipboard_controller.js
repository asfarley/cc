import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { target: String }

  copy(event) {
    const textElement = document.getElementById(this.targetValue)
    
    if (!textElement) {
      console.error('Target element not found:', this.targetValue)
      return
    }
    
    const text = textElement.textContent.trim()
    
    // Use modern clipboard API if available, fallback to legacy method
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text).then(() => {
        this.showSuccess()
      }).catch(err => {
        console.error('Failed to copy:', err)
        this.fallbackCopy(text)
      })
    } else {
      this.fallbackCopy(text)
    }
  }
  
  fallbackCopy(text) {
    const textarea = document.createElement('textarea')
    textarea.value = text
    textarea.style.position = 'fixed'
    textarea.style.opacity = '0'
    document.body.appendChild(textarea)
    textarea.select()
    
    try {
      document.execCommand('copy')
      this.showSuccess()
    } catch (err) {
      console.error('Fallback copy failed:', err)
    } finally {
      document.body.removeChild(textarea)
    }
  }
  
  showSuccess() {
    const icon = this.element.querySelector('i')
    const originalClass = icon.className
    
    icon.className = 'fa fa-check'
    this.element.style.color = '#28a745'
    
    setTimeout(() => {
      icon.className = originalClass
      this.element.style.color = '#007bff'
    }, 1500)
  }
}
