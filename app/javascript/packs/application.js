// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails"
import "stylesheets/application"
import "intl-tel-input/build/css/intlTelInput.css"

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

document.addEventListener('turbo:load', function(event) {
	// clearbit + GA
  let reveal_gtag_map = {
	  'send_page_view': false,
	  'custom_map': {
	    'type': 'type',
	    'companyName': 'companyName',
	    'companyDomain': 'companyDomain',
	    'companyIndustry': 'companyIndustry',
	    'companySubIndustry': 'companySubIndustry',
	    'companyEmployeesRange': 'companyEmployeesRange',
	    'companyRevenue': 'companyEstimatedAnnualRevenue',
	    'companyCity': 'companyCity',
	    'companyState': 'companyState',
	    'companyCountry': 'companyCountry'
	  }
	}

	// configures the tracking ID with the mapping
	gtag('config', process.env.NODE_ENV === "production" ? 'G-P4PYCQ18Y2' : 'G-0QQN6EMC6Y', reveal_gtag_map);

	let reveal_data_map = {};
	let nonCompany = "(Non-Company)";

	if (!window.reveal || !window.reveal.company) {
	  reveal_data_map = {
	    'non_interaction': true,
	    'type': window.reveal ? window.reveal.type : nonCompany,
	    'companyName':nonCompany,
	    'companyDomain':nonCompany,
	    'companyIndustry':nonCompany,
	    'companySubIndustry':nonCompany,
	    'companyEmployeesRange':nonCompany,
	    'companyEstimatedAnnualRevenue':nonCompany,
	    'companyCity':nonCompany,
	    'companyState':nonCompany,
	    'companyCountry':nonCompany
	  };
	}
	else {
	  let company = reveal.company;
	  reveal_data_map = {
	    'non_interaction': true,
	    'type':reveal.type,
	    'companyName':company.name,
	    'companyDomain':company.domain,
	    'companyIndustry':company.category.industry,
	    'companySubIndustry':company.category.subIndustry,
	    'companyEmployeesRange':company.metrics.employeesRange,
	    'companyEstimatedAnnualRevenue':company.metrics.estimatedAnnualRevenue,
	    'companyCity':company.geo.city,
	    'companyState':company.geo.state,
	    'companyCountry':company.geo.country
	  };
	}
	// send clearbit reveal call to GA
	gtag('event', 'Clearbit', reveal_data_map);
})

require("stylesheets/application.scss")
