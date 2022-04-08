import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr';

// https://github.com/sampotts/plyr

export default class extends Controller {
  connect() {
    new Plyr(this.element)
  }
}
