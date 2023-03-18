import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"
// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    console.log("hello")
    new TomSelect("#founder_sector_ids",{
      plugins: ['remove_button'],
      maxItems: 3
    });
  }
}
