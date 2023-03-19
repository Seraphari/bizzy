import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-investors"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    console.log(this.formTarget.action);
    console.log(this.inputTarget.value);
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&commit=Search`;
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then(data => {
      console.log(data)
    })
  }

}
