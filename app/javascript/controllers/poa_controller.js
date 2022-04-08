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
    "industry",
    "system",
		"country",
		"countryName",
		"countryCode",
		"callingCode",
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
    } else if (this.companySizeTarget.value == "Staff range") {
      this.formErrorTarget.innerHTML = "Please enter a staff range.";
      event.preventDefault()
    } else if (!this.validateEmail(this.emailTarget.value)) {
      this.formErrorTarget.innerHTML = "Try entering a valid email address.";
      event.preventDefault()
    } else if (this.phoneTarget.value == "") {
  		this.formErrorTarget.innerHTML = "Please enter your phone number.";
  		event.preventDefault()
    } else if (this.industryTarget.value == "") {
      this.formErrorTarget.innerHTML = "Please enter your industry.";
      event.preventDefault()
    } else if (this.systemTarget.value == "") {
      this.formErrorTarget.innerHTML = "Please enter your current scheduling system.";
      event.preventDefault()
  	} else {
      gtag('event', 'submitted_poa');
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
