import { Controller } from "@hotwired/stimulus"
import { enter, leave } from 'el-transition'; 

export default class extends Controller {
  static targets = ["mobileMenu"]

  open() {
    enter(this.mobileMenuTarget)
  }

  close() {
    leave(this.mobileMenuTarget)
  }
}
