import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-route"
export default class extends Controller {
  static targets = []
  connect() {
    console.log("Ciao from new route controller")
  }

  add() {
    console.log(this.currentTarget)
    // const destination =
  }
}
