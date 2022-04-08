import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["picker", "content"]
  static classes = ["hidden", "picker"]

  pick(event) {
    var pickerClasses = this.pickerClass.split(' ')
    this.pickerTargets.forEach(t => t.classList.remove(...pickerClasses))
    event.currentTarget.classList.add(...pickerClasses)
    this.filterContent(event)
  }

  filterContent(event) {
    var hiddenClass = this.hiddenClass
    var pickerCategory = event.currentTarget.getAttribute("data-category")
    this.contentTargets.forEach(function(t) {
      if (t.getAttribute("data-category") == pickerCategory || t.getAttribute("data-category").includes(pickerCategory) || pickerCategory == "all") {
        t.classList.remove(hiddenClass)
      } else {
        t.classList.add(hiddenClass)
      }
    })
  }

}
