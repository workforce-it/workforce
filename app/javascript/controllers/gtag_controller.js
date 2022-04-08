import { Controller } from "@hotwired/stimulus"

// Global Google Tag Controller: Use for embedding gtag events
export default class extends Controller {
    // google tag used to segment product users accessing marketing site to "login"
    loginClick() {
        gtag('event', 'login_click');
      }
}
