import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	static classes = [ "hidden" ]
	static targets = [ 
		"formError",
		"email",
		"companyName",
		"companySize",
		"firstName",
		"lastName",
		"phone",
		"country",
		"countryName",
		"countryCode",
		"callingCode",
		"loading"
	]
  
 connect() {
  	this.formElement = this.element
  }

  submit() {
    if (this.firstNameTarget.value == "" || this.lastNameTarget.value == "") {
      this.formErrorTarget.innerHTML = "Please enter your name.";
      event.preventDefault()
    } else if (this.companyNameTarget.value == "") {
      this.formErrorTarget.innerHTML = "Please enter a company name.";
      event.preventDefault()
    } else if (this.companySizeTarget.value === "Staff range") {
      this.formErrorTarget.innerHTML = "Please enter a staff range.";
      event.preventDefault()
    } else if (!this.validateEmail(this.emailTarget.value)) {
      this.formErrorTarget.innerHTML = "Try entering a valid email address.";
      event.preventDefault()
    } else if (this.phoneTarget.value == "") {
  		this.formErrorTarget.innerHTML = "Please enter your phone number.";
  		event.preventDefault()
  	} else {
  		this.loadingTarget.classList.remove(this.hiddenClass)
      gtag('event', 'booked_call');
	  window.lintrk('track', { conversion_id: 6345762 });
      clearbit.identify(this.emailTarget.value, {
        'email': this.emailTarget.value,
		'company': this.companyNameTarget.value
      });
  	}
  }

  validateEmail(email) {
	 	if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(email)) {
		  return true
		} else {
		  return false
		}
	}

}
