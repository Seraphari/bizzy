import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log("Hi");
    flatpickr(this.element, {
      inline: true,
      dateFormat: "Y-m-d",
      maxDate: "today"
    });
  }
}
