import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Make Memories.", "Make History", "Make Memories. Make History"],
      typeSpeed: 100,
      loop: false
    });
  }
}
