import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  scrollLoad() {
    console.log("hello");
    $(document).ready(function () {
      // Handler for .ready() called.
      $('html, body').animate({
          scrollTop: $('#go-today').offset().top
      }, 'slow');
  });
  };
}
