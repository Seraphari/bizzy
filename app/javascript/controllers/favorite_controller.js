import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["bookmark", "FavoritesList"]

  connect() {
  }

  update() {
    if (this.bookmarkTarget.classList.value.includes("fa-regular")) {
      this.bookmarkTarget.classList.remove("fa-regular")
      this.bookmarkTarget.classList.add("fa-solid")
    } else {
      this.bookmarkTarget.classList.remove("fa-solid")
      // this.bookmarkTarget.classList.add("fa-regular")
      this.addFavorite()
    }
  }

  addFavorite() {
    const investor = this.data.get("investor")
    this.favoritesListTarget.insertAdjacentHTML("beforeend", investor)
  }

  removeFavorite() {
    // const investorId = this.data.get("investorId")
    // const favorite = this.favoritesListTarget.querySelector(`[data-id='${investorId}']`)
      if (favorite) {
        favorite.remove()
      }
  }
}
