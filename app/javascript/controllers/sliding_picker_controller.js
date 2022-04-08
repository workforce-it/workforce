import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["picker", "content"]
  static classes = ["active"]
  static values = { axis: String }

  pick(event) {
    this.pickerTargets.forEach(t => t.classList.remove(...this.activeClasses))
    event.currentTarget.classList.add(...this.activeClasses)
    this.contentTarget.style.transform = `translate${this.axisValue}(${event.currentTarget.getAttribute("data-transition")})`
  }
}
