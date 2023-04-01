import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["heart","savelist"]

  connect() {
    console.dir(this.savelistTarget)

  }

  update(event) {
    console.log(event.params)
    if (this.heartTarget.classList.value.includes("fa-regular")) {
      this.heartTarget.classList.remove("fa-regular")
      this.heartTarget.classList.add("fa-solid")
      this.savelistTarget.insertAdjacentHTML("beforeend", `<p><a href="/investors/${event.params.id}">${event.params.name}</a></p>`)

    } else {
      this.heartTarget.classList.remove("fa-solid")
      this.heartTarget.classList.add("fa-regular")
    }
  }
}
