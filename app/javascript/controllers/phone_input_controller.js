import { Controller } from "@hotwired/stimulus"
import intlTelInput from 'intl-tel-input'

export default class extends Controller {
  static targets = ["source", "phoneError", "country", "countryName", "countryCode", "callingCode"]
  static values = { region: String }

  async connect () {
    if (this.regionValue == "us") {
      this.countryTarget.value = "US"
      this.countryNameTarget.value = "United States"
      this.countryCodeTarget.value = "US"
      this.callingCodeTarget.value = 1
    } else {
      this.countryTarget.value = "GB"
      this.countryNameTarget.value = "United Kingdom"
      this.countryCodeTarget.value = "GB"
      this.callingCodeTarget.value = 44
    }
    this.iti = intlTelInput(this.sourceTarget, {
      initialCountry: this.countryTarget.value,
      preferredCountries: ["us", "gb", "ca"],
      // this script enables validation
      utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js"
    })
  }

  // override the IP address pulled country if the user changes with the picker
  changeCountry () {
    this.countryTarget.value = this.iti.getSelectedCountryData().iso2.toUpperCase()
    this.countryCodeTarget.value = this.iti.getSelectedCountryData().iso2.toUpperCase()
    this.countryNameTarget.value = this.iti.getSelectedCountryData().name
    this.callingCodeTarget.value = this.iti.getSelectedCountryData().dialCode
  }

  // on blur, check the number is valid
  validate () {
    var errorMap = ["Invalid number", "Invalid country code", "Phone number too short", "Phone number too long", "Invalid number"];
    this.phoneErrorTarget.innerHTML = "";
    if (this.sourceTarget.value.trim()) {
      if (!this.iti.isValidNumber()) {
        var errorCode = this.iti.getValidationError();
        this.phoneErrorTarget.innerHTML = errorMap[errorCode];
      }
    }
  }

}
