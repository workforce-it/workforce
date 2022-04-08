import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	static classes = [ "inactive", "active" ]
	static targets = [ 
		"emailStep",
		"companyStep",
		"personalStep",
		"emailFormError",
		"companyFormError",
		"personalFormError",
		"email",
		"companyName",
		"companySize",
		"firstName",
		"lastName",
		"phone",
		"city",
		"region",
		"regionCode",
		"country",
		"countryName",
		"countryCode",
		"continentCode",
		"inEU",
		"postal",
		"latitude",
		"longitude",
		"callingCode",
    "loading"
	]
  
 	connect() {
  	this.formElement = this.element
  }

  async emailStep(event) {
  	event.preventDefault()

  	if (!this.validateEmail(this.emailTarget.value)) {
      this.emailFormErrorTarget.innerHTML = "Try entering a valid email address.";
      return
    }

    const isValidEmail = await this.checkDuplicateEmail(this.emailTarget.value)

    if (isValidEmail) {
      this.emailStepTarget.classList.add(this.inactiveClass);
      this.companyStepTarget.classList.remove(this.inactiveClass);
      event.target.remove();
      this.companyNameTarget.select();
      this.companyIPData();	
      gtag('event', 'trial_1');
      clearbit.identify(this.emailTarget.value, {
        'email': this.emailTarget.value,
		'company': this.companyNameTarget.value
      });
    } else {
    	this.emailFormErrorTarget.innerHTML = "This email is already taken. Try logging in.";
    }
  }

  companyStep() {
  	event.preventDefault()
  	if (this.companyNameTarget.value == "") {
  		this.companyFormErrorTarget.innerHTML = "Please enter a company name.";
  	} else if (this.companySizeTarget.value === "Staff range") {
  		this.companyFormErrorTarget.innerHTML = "Please enter a staff range.";
  	} else {
  		this.companyStepTarget.classList.add(this.inactiveClass);
      this.personalStepTarget.classList.remove(this.inactiveClass);
      event.target.remove();
      this.firstNameTarget.select();
      gtag('event', 'trial_2');
  	}
  }

  personalStep() {
  	event.preventDefault()
  	if (this.firstNameTarget.value == "" || this.lastNameTarget.value == "") {
  		this.personalFormErrorTarget.innerHTML = "Please enter your name.";
  	} else if (this.phoneTarget.value == "") {
  		this.personalFormErrorTarget.innerHTML = "Please enter your phone number.";
  	} else {
      this.loadingTarget.classList.remove(this.inactiveClass)
  		this.formElement.submit()
      gtag('event', 'started_trial');
	  window.lintrk('track', { conversion_id: 6345762 });
  	}
  }

  async companyIPData() {
  	const results = await this.getIPData()
  	this.cityTarget.value = results.city;
  	this.regionTarget.value = results.region;
  	this.regionCodeTarget.value = results.region_code;
  	this.countryTarget.value = results.country;
		this.countryNameTarget.value = results.country_name;
		this.countryCodeTarget.value = results.country_code;
		this.continentCodeTarget.value = results.continent_code;
		this.inEUTarget.value = results.in_eu;
		this.postalTarget.value = results.postal;
		this.latitudeTarget.value = results.latitude;
		this.longitudeTarget.value = results.longitude;
		this.callingCodeTarget.value = results.calling_code;
  }

  async getIPData() {
  	return fetch("https://ipapi.co/json/?key=1XGP0YJhQyIvcsanbCZt2iIwkVxkEzeYS4f1nKNlmnlp6mMG5p")
		  .then(response => response.json())
		  .then(data => data)
  }

  validateEmail(email) {
	 	if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(email)) {
		  return true
		} else {
		  return false
		}
	}

  async checkDuplicateEmail(email) {
  	return fetch("https://my.workforce.com/try/validate_email?email=" + email)
		  .then(response => response.json())
		  .then(data => data)
  }
}
