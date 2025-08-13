import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    // Initialize mobile menu state
    this.isOpen = false
  }

  toggle() {
    if (this.isOpen) {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    this.menuTarget.classList.remove("hidden")
    this.buttonTarget.innerHTML = `
      <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
      </svg>
    `
    this.isOpen = true
  }

  close() {
    this.menuTarget.classList.add("hidden")
    this.buttonTarget.innerHTML = `
      <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
      </svg>
    `
    this.isOpen = false
  }

  // Close menu when clicking outside
  clickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  // Close menu on escape key
  keydown(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }
} 