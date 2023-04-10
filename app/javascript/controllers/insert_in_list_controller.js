// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="insert-in-list"
// export default class extends Controller {
//   static targets = ["items", "favorites"]
//   static values = { position: String}
//   connect() {
//   }
//   this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")

//   send(event) {
//     event.preventDefault()
//     const url = this.formTarget.action
//     const options = {
//       method: "post"
//       headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
//       body: new FormData(this.formTarget)
//     }
//     fetch(url, options)
//     .then(response => response.json())
//     .then((data) => {
//       if (data.my_inserted_item) {
//         this.itemsTarget.insertAdjacentHTML((this.positionValue), data.my_inserted_item)
//       }
//       this.formTarget.outerHTML = data.my_form
//     })
//   }
// }
