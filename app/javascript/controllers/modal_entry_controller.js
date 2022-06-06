import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal"]

  connect() {
    console.log("Hello")
    console.log(this.modalTarget)
    //console.log(this.newTarget)
  }
  getContent(event) {
    event.preventDefault()
    console.log(event.currentTarget.href)
    const url = event.currentTarget.href
    fetch(url,
      {
        headers: { "Accept": "text/plain"},
      }
    )
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.modalTarget.innerHTML = data
      })
  };

  // getContentNew(event) {
  //   event.preventDefault()
  //   console.log(event.currentTarget.href)
  //   const url = event.currentTarget.href
  //   fetch(url,
  //     {
  //       headers: { "Accept": "text/plain"},
  //     }
  //   )
  //     .then(response => response.text())
  //     .then((data) => {
  //       this.newTarget.innerHTML = data
  //     })
  // };
}
