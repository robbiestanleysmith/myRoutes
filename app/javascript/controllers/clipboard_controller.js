import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  connect() {
    console.log("clipboard controller");
  }

  copy(event) { 
    console.log(event)
    this.inputTarget.select();
    document.execCommand('copy');
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = this.feedbackTextValue;
  }
}
