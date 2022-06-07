import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card", "input"]

  connect() {}

  toggleCard(event) {
    console.log(event.currentTarget.value)
    const selected_value = event.currentTarget.value;
    console.log(this.cardTargets)
    this.cardTargets.forEach(card => {
      if (card.dataset.id == selected_value) {
        card.classList.remove("d-none");
      } else {
        card.classList.add("d-none");
      }
    });
  }
}
