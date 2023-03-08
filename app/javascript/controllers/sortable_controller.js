// src/controllers/sortable_controller.js

import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {

  static targets = ["results"]

  connect() {
    console.log("Sortable controller is connected!")


    Sortable.create(this.resultsTarget, {
      animation: 150,
      ghostClass: 'blue-background-class',
      // onEnd: (event) => {
      //   alert(`${event.oldIndex} moved to ${event.newIndex}`)
      // }
    });
  }


}
