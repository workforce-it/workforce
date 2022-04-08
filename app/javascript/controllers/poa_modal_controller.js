import { Controller } from "@hotwired/stimulus"
import { enter, leave } from 'el-transition'; 

export default class extends Controller {
  static classes = ["open", "close"]
  static targets = ["panel", "bg"]

  open() {
    enter(this.panelTarget)
    enter(this.bgTarget)
  }

  close() {
    if (event.target === event.currentTarget) {
      leave(this.panelTarget)
      leave(this.bgTarget)
    }
  }
}
