import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  disable () {
    this.element.querySelectorAll("[type=submit]").forEach(e => {
      e.disabled = true
    })
  }
}
