import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["topic", "entry"]

  connect() {
    console.log(this.topicTargets)
    console.log(this.entriesTargets)
  }


  toggleCard(event) {
    const selected_value = event.params.category;
    console.log(event.params.category)

    this.topicTargets.forEach(topic => {

      if (topic.dataset.category == selected_value) {
        topic.classList.remove("d-none");
      } else {
        topic.classList.add("d-none");
      }
    });

    this.entryTargets.forEach(entry => {
      if (entry.dataset.category == selected_value) {
        entry.classList.remove("d-none");
      } else {
        entry.classList.add("d-none");
      }
    });
  }
}
