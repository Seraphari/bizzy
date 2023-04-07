import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="focus"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("hello")
    console.log(this.element)
  }

  update() {
    console.log(this.element)
  }
}



// const buttons = document.querySelectorAll(".default-button");
// buttons.forEach(button => {
//   button.addEventListener("click", function() {
//     // Remove "active-button" class from all buttons
//     buttons.forEach(btn => btn.classList.remove("active-button"));

//     // Add "active-button" class to the clicked button
//     button.classList.add("active-button");
//   });
// });
