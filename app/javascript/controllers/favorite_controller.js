import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["heart"]

  connect() {
  }

  update() {
    if (this.heartTarget.classList.value.includes("fa-regular")) {
      this.heartTarget.classList.remove("fa-regular")
      this.heartTarget.classList.add("fa-solid")
    } else {
      this.heartTarget.classList.remove("fa-solid")
      this.heartTarget.classList.add("fa-regular")
    }
  }
}
