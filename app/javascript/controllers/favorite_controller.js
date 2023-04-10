import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["heart"]

  connect() {
    // console.dir(this.savelistTarget)
  }

  update() {
    if (this.heartTarget.classList.value.includes("fa-regular")) {
      this.heartTarget.classList.remove("fa-regular")
      this.heartTarget.classList.add("fa-solid")
      // this.savelistTarget.insertAdjacentHTML("beforeend", `<p><a href="/investors/${event.params.id}">${event.params.name}</a></p>`)
    } else {
      this.bookmarkTarget.classList.remove("fa-solid")
      this.bookmarkTarget.classList.add("fa-regular")
      // this.addFavorite()
    }
  }

  // addFavorite() {
  //   const investor = this.data.get("investor")
  //   this.favoritesListTarget.insertAdjacentHTML("beforeend", investor)
  // }


  // removeFavorite() {
  //   // const investorId = this.data.get("investorId")
  //   // const favorite = this.favoritesListTarget.querySelector(`[data-id='${investorId}']`)
  //     if (togggle_favorite) {
  //       toggle_favorite.remove()
  //     }
  // }
}
