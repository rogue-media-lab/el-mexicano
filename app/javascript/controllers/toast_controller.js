import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Slide in
    this.element.style.transform = "translateX(120%)"
    this.element.style.opacity = "0"
    requestAnimationFrame(() => {
      this.element.style.transition = "transform 0.3s ease, opacity 0.3s ease"
      this.element.style.transform = "translateX(0)"
      this.element.style.opacity = "1"
    })

    // Auto dismiss after 4 seconds
    this.timeout = setTimeout(() => this.dismiss(), 4000)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }

  dismiss() {
    clearTimeout(this.timeout)
    this.element.style.transform = "translateX(120%)"
    this.element.style.opacity = "0"
    setTimeout(() => this.element.remove(), 300)
  }
}
