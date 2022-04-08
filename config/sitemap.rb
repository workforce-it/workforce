# Sitemap generator config
# Add new routes here then run `rake sitemap:refresh`

# gem docs https://github.com/kjvarga/sitemap_generator#sitemapgeneratorfileadapter

# US config
sitemap_opts = {
  create_index: false,
  default_host: 'https://workforce.com',
  compress: false,
  sitemaps_path: '',
  namer: SimpleNamer.new(:sitemap)
}

# UK config
uk_sitemap_opts = {
  create_index: false,
  default_host: 'https://workforce.com/uk',
  compress: false,
  sitemaps_path: '',
  namer: SitemapGenerator::SimpleNamer.new(:uk_sitemap)
}

# News config for US/UK
news_sitemap_opts = {
  create_index: false,
  default_host: 'https://workforce.com',
  compress: false,
  sitemaps_path: '',
  namer: SitemapGenerator::SimpleNamer.new(:news_sitemap)
}

# Index config sitemap for all sitemaps
index_sitemap_opts = {
  create_index: true,
  include_index: false,
  include_root: false,
  default_host: 'https://workforce.com',
  compress: false,
  sitemaps_path: '',
  namer: SitemapGenerator::SimpleNamer.new(:index)
}

# Route property options ---
# changefreq - 'always', 'hourly', 'daily', 'weekly', 'monthly', 'yearly' or 'never'
# lastmod - Default: Time.now The date and time of last modification.
# priority - Default: 0.5 (Float). The priority of the URL relative to other URLs on a scale from 0 to 1
# expires - Optional (Integer, Time, Date, DateTime, String): Request removal of this URL from search engines' indexes. Example (uses ActiveSupport):

# US routes
# will display as https://workforce.com + add
SitemapGenerator::Sitemap.create sitemap_opts do

  add "/how_it_works", :changefreq => 'monthly', :priority => 0.8
  add "/role_by_role", :changefreq => 'monthly', :priority => 0.8
  add "/why_different", :changefreq => 'monthly', :priority => 0.8
  add "/customers", :changefreq => 'monthly', :priority => 0.8

  add "/pricing", :changefreq => 'monthly', :priority => 0.9
  add "/contact-us", :changefreq => 'monthly', :priority => 0.5
  add "/integrations", :changefreq => 'monthly', :priority => 0.8

  add "/try", :changefreq => 'monthly', :priority => 0.9

  add "/software/scheduling-software", :changefreq => 'monthly', :priority => 0.9
  add "/software/time-and-attendance", :changefreq => 'monthly', :priority => 0.9
  add "/software/employee-app", :changefreq => 'monthly', :priority => 0.9
  add "/software/timeclock-app", :changefreq => 'monthly', :priority => 0.9
  add "/software/auto-scheduling", :changefreq => 'monthly', :priority => 0.9
  add "/software/employee-onboarding", :changefreq => 'monthly', :priority => 0.9
  add "/software/wage-and-hour-compliance", :changefreq => 'monthly', :priority => 0.9
  add "/software/payroll-integration", :changefreq => 'monthly', :priority => 0.9
  add "/software/employee-communications", :changefreq => 'monthly', :priority => 0.9

  add "/integrations/workday", :changefreq => 'monthly', :priority => 0.6

  add "/integrations/brightpay", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/xero", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/lightspeed", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/goodtill", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/zettle", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/backofhouse", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/twicebaked", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/icr-touch", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/tenzo", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/vitamojo", :changefreq => 'monthly', :priority => 0.6

  # add "/software/rota", :changefreq => 'monthly', :priority => 0.6

  add "/industry/hospitality", :changefreq => 'monthly', :priority => 0.6
  add "/industry/staffing", :changefreq => 'monthly', :priority => 0.6

  add "/industry/restaurant-and-bars", :changefreq => 'monthly', :priority => 0.6
  add "/industry/hospitals", :changefreq => 'monthly', :priority => 0.6
  add "/industry/call-centers", :changefreq => 'monthly', :priority => 0.6
  add "/industry/construction", :changefreq => 'monthly', :priority => 0.6
  add "/industry/elderly-care", :changefreq => 'monthly', :priority => 0.6
  add "/industry/healthcare", :changefreq => 'monthly', :priority => 0.6

  add "/industry/hotels", :changefreq => 'monthly', :priority => 0.6
  add "/industry/manufacturing", :changefreq => 'monthly', :priority => 0.6
  add "/industry/retail", :changefreq => 'monthly', :priority => 0.6
  add "/industry/franchise", :changefreq => 'monthly', :priority => 0.6

  
  add "/whitepapers", :changefreq => 'monthly', :priority => 0.6

  add "/privacy-policy", :changefreq => 'monthly', :priority => 0.3
  add "/terms", :changefreq => 'monthly', :priority => 0.3
  add "/cookies", :changefreq => 'monthly', :priority => 0.3
  add "/security", :changefreq => 'monthly', :priority => 0.3
  add "/biometric", :changefreq => 'monthly', :priority => 0.3
  add "/gdpr", :changefreq => 'monthly', :priority => 0.3

  add "/industry/call-center/scheduling", :changefreq => 'monthly', :priority => 0.3
  add "/industry/call-center/workforce-management", :changefreq => 'monthly', :priority => 0.3
  add "/industry/hospitals/scheduling", :changefreq => 'monthly', :priority => 0.3
  add "/industry/restaurant-and-dining", :changefreq => 'monthly', :priority => 0.3
  add "/industry/construction/scheduling", :changefreq => 'monthly', :priority => 0.3
  add "/industry/elderly-care/scheduling", :changefreq => 'monthly', :priority => 0.3

  add "/news", :changefreq => 'daily', :priority => 0.5

  add "/sitemap.xml"
  add "/robots.txt"
  add_to_index "uk_sitemap.xml", :host => 'https://workforce.com' 
  add_to_index "news_sitemap.xml", :host => 'https://workforce.com' 

end

# UK routes
# will display as https://workforce.com/uk + add
SitemapGenerator::Sitemap.create uk_sitemap_opts do
  add "/how_it_works", :changefreq => 'monthly', :priority => 0.8
  add "/role_by_role", :changefreq => 'monthly', :priority => 0.8
  add "/why_different", :changefreq => 'monthly', :priority => 0.8
  add "/customers", :changefreq => 'monthly', :priority => 0.8

  add "/pricing", :changefreq => 'monthly', :priority => 0.9
  add "/contact-us", :changefreq => 'monthly', :priority => 0.5
  add "/integrations", :changefreq => 'monthly', :priority => 0.8

  add "/try", :changefreq => 'monthly', :priority => 0.9

  add "/software/rota", :changefreq => 'monthly', :priority => 0.9
  add "/software/time-and-attendance", :changefreq => 'monthly', :priority => 0.9
  add "/software/employee-app", :changefreq => 'monthly', :priority => 0.9
  add "/software/timeclock-app", :changefreq => 'monthly', :priority => 0.9
  add "/software/auto-scheduling", :changefreq => 'monthly', :priority => 0.9
  add "/software/employee-onboarding", :changefreq => 'monthly', :priority => 0.9
  add "/software/wage-and-hour-compliance", :changefreq => 'monthly', :priority => 0.9
  add "/software/payroll-integration", :changefreq => 'monthly', :priority => 0.9
  add "/software/employee-communications", :changefreq => 'monthly', :priority => 0.9

  add "/integrations/workday", :changefreq => 'monthly', :priority => 0.6

  add "/integrations/brightpay", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/xero", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/lightspeed", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/goodtill", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/zettle", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/backofhouse", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/twicebaked", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/icr-touch", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/tenzo", :changefreq => 'monthly', :priority => 0.6
  add "/integrations/vitamojo", :changefreq => 'monthly', :priority => 0.6

  # add "/software/rota", :changefreq => 'monthly', :priority => 0.6

  add "/industry/hospitality", :changefreq => 'monthly', :priority => 0.6
  add "/industry/staffing", :changefreq => 'monthly', :priority => 0.6

  add "/industry/restaurant-and-bars", :changefreq => 'monthly', :priority => 0.6
  add "/industry/hospitals", :changefreq => 'monthly', :priority => 0.6
  add "/industry/call-centers", :changefreq => 'monthly', :priority => 0.6
  add "/industry/construction", :changefreq => 'monthly', :priority => 0.6
  add "/industry/elderly-care", :changefreq => 'monthly', :priority => 0.6
  add "/industry/healthcare", :changefreq => 'monthly', :priority => 0.6

  add "/industry/hotels", :changefreq => 'monthly', :priority => 0.6
  add "/industry/manufacturing", :changefreq => 'monthly', :priority => 0.6
  add "/industry/retail", :changefreq => 'monthly', :priority => 0.6
  add "/industry/franchise", :changefreq => 'monthly', :priority => 0.6

  
  add "/whitepapers", :changefreq => 'monthly', :priority => 0.6

  add "/privacy-policy", :changefreq => 'monthly', :priority => 0.3
  add "/terms", :changefreq => 'monthly', :priority => 0.3
  add "/cookies", :changefreq => 'monthly', :priority => 0.3
  add "/security", :changefreq => 'monthly', :priority => 0.3
  add "/biometric", :changefreq => 'monthly', :priority => 0.3
  add "/gdpr", :changefreq => 'monthly', :priority => 0.3

  add "/industry/call-center/scheduling", :changefreq => 'monthly', :priority => 0.3
  add "/industry/call-center/workforce-management", :changefreq => 'monthly', :priority => 0.3
  add "/industry/hospitals/scheduling", :changefreq => 'monthly', :priority => 0.3
  add "/industry/restaurant-and-dining", :changefreq => 'monthly', :priority => 0.3
  add "/industry/construction/scheduling", :changefreq => 'monthly', :priority => 0.3
  add "/industry/elderly-care/scheduling", :changefreq => 'monthly', :priority => 0.3

  add "/news", :changefreq => 'daily', :priority => 0.5
 
end

# US and UK news routes
# will display as https://workforce.com + add
SitemapGenerator::Sitemap.create news_sitemap_opts do
 add "/news/evaluate-these-common-12-hour-shift-schedules", :changefreq => 'yearly', :priority => 0.1
add "/news/the-top-7-recent-employment-law-cases-you-should-know", :changefreq => 'yearly', :priority => 0.1
add "/news/31-core-competencies-explained", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-calculate-pto-versus-traditional-sick-leave-and-vacation-policies", :changefreq => 'yearly', :priority => 0.1
add "/news/time-theft", :changefreq => 'yearly', :priority => 0.1
add "/news/6-reasons-not-say-caucasian", :changefreq => 'yearly', :priority => 0.1
add "/news/when-an-employee-is-listed-as-a-sex-offender", :changefreq => 'yearly', :priority => 0.1
add "/news/ratio-of-it-staff-to-employees", :changefreq => 'yearly', :priority => 0.1
add "/news/sample-communication-policy", :changefreq => 'yearly', :priority => 0.1
add "/news/2019-workforce-100-ranking-top-companies-hr", :changefreq => 'yearly', :priority => 0.1
add "/news/you-just-discovered-you-hired-a-sex-offender-now-what", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-calculate-time-cards-manually-foolproof-step-by-step-instructions", :changefreq => 'yearly', :priority => 0.1
add "/news/ugly-truth-online-assessment-testing", :changefreq => 'yearly', :priority => 0.1
add "/news/what-exactly-is-information-technology-it", :changefreq => 'yearly', :priority => 0.1
add "/news/what-are-some-standard-guidelines-for-working-at-home", :changefreq => 'yearly', :priority => 0.1
add "/news/sample-three-month-performance-review", :changefreq => 'yearly', :priority => 0.1
add "/news/ten-simple-rules-for-managing-in-a-unionized-setting", :changefreq => 'yearly', :priority => 0.1
add "/news/how-far-in-advance-must-a-work-schedule-be-posted", :changefreq => 'yearly', :priority => 0.1
add "/news/not-all-prizes-and-awards-are-taxable", :changefreq => 'yearly', :priority => 0.1
add "/news/underestimate-effects-poor-communication", :changefreq => 'yearly', :priority => 0.1
add "/news/track-employee-attendance", :changefreq => 'yearly', :priority => 0.1
add "/news/which-mental-health-service-does-the-fmla-not-cover", :changefreq => 'yearly', :priority => 0.1
add "/news/unlimited-paid-time-off-is-a-deceptive-ploy-in-todays-workplace", :changefreq => 'yearly', :priority => 0.1
add "/news/reward-and-recognition-questionnaire", :changefreq => 'yearly', :priority => 0.1
add "/news/the-womens-movement-in-the-70s-today-youve-come-a-long-way-but", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-communicate-when-an-employee-tests-positive-for-covid-19", :changefreq => 'yearly', :priority => 0.1
add "/news/relocations-that-move-into-legal-quagmires", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-manage-subcultures-organization", :changefreq => 'yearly', :priority => 0.1
add "/news/do-employees-have-the-right-to-moonlight", :changefreq => 'yearly', :priority => 0.1
add "/news/12-steps-to-building-a-best-practices-ethics-program", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-commit-to-self-development", :changefreq => 'yearly', :priority => 0.1
add "/news/track-employee-hours", :changefreq => 'yearly', :priority => 0.1
add "/news/stop-toxic-managers-before-they-stop-you", :changefreq => 'yearly', :priority => 0.1
add "/news/managing-employee-time-off-requests", :changefreq => 'yearly', :priority => 0.1
add "/news/the-future-of-automated-employee-scheduling", :changefreq => 'yearly', :priority => 0.1
add "/news/brassring", :changefreq => 'yearly', :priority => 0.1
add "/news/workforce-magazine-guidelines-for-writers-and-contributors", :changefreq => 'yearly', :priority => 0.1
add "/news/starbucks-is-pleasing-employees-and-pouring-profits", :changefreq => 'yearly', :priority => 0.1
add "/news/employee-copying-documents-protected-activity-unlawful-stealing", :changefreq => 'yearly', :priority => 0.1
add "/news/the-pros-and-cons-of-tip-sharing-in-restaurants", :changefreq => 'yearly', :priority => 0.1
add "/news/employee-evaluation-checklist", :changefreq => 'yearly', :priority => 0.1
add "/news/playing-it-safe-a-look-at-workplace-safety-during-the-roaring-20s-and-now", :changefreq => 'yearly', :priority => 0.1
add "/news/use-your-strengths-to-strengthen-others", :changefreq => 'yearly', :priority => 0.1
add "/news/work-schedule-planning", :changefreq => 'yearly', :priority => 0.1
add "/news/the-essential-guide-to-shift-planning", :changefreq => 'yearly', :priority => 0.1
add "/news/employees-top-training-needs", :changefreq => 'yearly', :priority => 0.1
add "/news/southwest-airlines-flies-to-the-top-of-the-2019-workforce-100", :changefreq => 'yearly', :priority => 0.1
add "/news/nicotine-screenings-snuff-out-some-employment-offers-at-health-care-companies", :changefreq => 'yearly', :priority => 0.1
add "/news/religious-accommodation-for-muslim-employees", :changefreq => 'yearly', :priority => 0.1
add "/news/why-you-need-workforce-planning", :changefreq => 'yearly', :priority => 0.1
add "/news/10-measures-of-human-capital-management", :changefreq => 'yearly', :priority => 0.1
add "/news/skip-the-pip"
add "/news/time-off-policies-leave-well-enough-alone-or-go-pto", :changefreq => 'yearly', :priority => 0.1
add "/news/interview-questions-legal-or-illegal-2", :changefreq => 'yearly', :priority => 0.1
add "/news/10-ways-that-managers-can-help-overworked-employees-reduce-stress", :changefreq => 'yearly', :priority => 0.1
add "/news/five-components-of-a-total-reward-strategy", :changefreq => 'yearly', :priority => 0.1
add "/news/managing-strikes-minimizing-loss", :changefreq => 'yearly', :priority => 0.1
add "/news/predictive-scheduling-laws-what-are-they-where-do-they-exist-and-employers-reaction", :changefreq => 'yearly', :priority => 0.1
add "/news/sabotage-in-the-workplace-is-an-inside-job", :changefreq => 'yearly', :priority => 0.1
add "/news/sample-flextime-policy"
add "/news/a-business-owners-guide-to-restaurant-tipping-law", :changefreq => 'yearly', :priority => 0.1
add "/news/the-six-benchmarking-steps-you-need", :changefreq => 'yearly', :priority => 0.1
add "/news/coca-cola-division-refreshes-its-talent-with-diversity-push-on-campus", :changefreq => 'yearly', :priority => 0.1
add "/news/poor-internal-communication-can-be-a-costly-mistake-for-businesses", :changefreq => 'yearly', :priority => 0.1
add "/news/succession-planning-roadmap/", :changefreq => 'yearly', :priority => 0.1
add "/news/when-is-1250-not-1250-hours-worked-versus-hours-paid-for-fmla-eligibility", :changefreq => 'yearly', :priority => 0.1
add "/news/sample-tuition-reimbursement-policy", :changefreq => 'yearly', :priority => 0.1
add "/news/4-things-employers-must-know-wage-garnishment", :changefreq => 'yearly', :priority => 0.1
add "/news/workforce-online-customer-service", :changefreq => 'yearly', :priority => 0.1
add "/news/bring-back-classical-management", :changefreq => 'yearly', :priority => 0.1
add "/news/who-pays-for-employer-mandated-covid-19-tests", :changefreq => 'yearly', :priority => 0.1
add "/news/shift-bids-vs-shift-swaps-which-is-right-for-your-business", :changefreq => 'yearly', :priority => 0.1
add "/news/5-retail-scheduling-best-practices", :changefreq => 'yearly', :priority => 0.1
add "/news/can-transition-older-workers-cant-force-retire", :changefreq => 'yearly', :priority => 0.1
add "/news/sample-letters-to-applicants-selected-or-not-selected-for-interview", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-solve-short-staffing-with-more-efficient-scheduling", :changefreq => 'yearly', :priority => 0.1
add "/news/new-japanese-law-requires-employers-to-combat-obesity-in-the-workforce", :changefreq => 'yearly', :priority => 0.1
add "/news/what-are-your-organizations-critical-positions", :changefreq => 'yearly', :priority => 0.1
add "/news/public-sector-employers-facing-people-problems", :changefreq => 'yearly', :priority => 0.1
add "/news/do-workplace-bullies-violate-osha", :changefreq => 'yearly', :priority => 0.1
add "/news/quality-within-the-hr-function", :changefreq => 'yearly', :priority => 0.1
add "/news/urine-trouble-court-to-decide-whether-an-employer-can-require-direct-observation-of-a-workplace-urine-sample-collection", :changefreq => 'yearly', :priority => 0.1
add "/news/in-harassment-cases-the-context-of-profanities-matters-but-only-sometimes", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-behave-and-not-behave-in-a-deposition", :changefreq => 'yearly', :priority => 0.1
add "/news/common-contractor-myths", :changefreq => 'yearly', :priority => 0.1
add "/news/light-duty-limited-duty-or-modified-duty-assignments", :changefreq => 'yearly', :priority => 0.1
add "/news/white-people-diversity-work", :changefreq => 'yearly', :priority => 0.1
add "/news/inclusion-doesnt-mean-including-everything-everyone", :changefreq => 'yearly', :priority => 0.1
add "/news/acknowledgment-of-receipt-of-employee-handbook", :changefreq => 'yearly', :priority => 0.1
add "/news/the-history-of-retirement-benefits", :changefreq => 'yearly', :priority => 0.1
add "/news/eight-principles-of-functional-training", :changefreq => 'yearly', :priority => 0.1
add "/news/the-most-pressing-workforce-management-issues-of-2020", :changefreq => 'yearly', :priority => 0.1
add "/news/talkin-about-their-generations-the-workforce-of-the-50s-and-today", :changefreq => 'yearly', :priority => 0.1
add "/news/do-employers-have-a-duty-to-protect-employees-personal-information", :changefreq => 'yearly', :priority => 0.1
add "/news/an-hr-audit", :changefreq => 'yearly', :priority => 0.1
add "/news/when-a-lawsuit-has-your-name-on-it", :changefreq => 'yearly', :priority => 0.1
add "/news/restaurant-employee-schedule", :changefreq => 'yearly', :priority => 0.1
add "/news/employee-engagement-and-good-brand-image", :changefreq => 'yearly', :priority => 0.1
add "/news/granting-equity-incentives-to-employees", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-determine-future-work-force-needs", :changefreq => 'yearly', :priority => 0.1
add "/news/must-you-accommodate-an-employee-with-a-high-risk-family-member", :changefreq => 'yearly', :priority => 0.1
add "/news/the-benefits-of-offering-backup-elder-care-to-employees", :changefreq => 'yearly', :priority => 0.1
add "/news/time-and-attendance-challenges-and-how-to-solve-them", :changefreq => 'yearly', :priority => 0.1
add "/news/6-states-now-mandate-sexual-harassment-prevention-training", :changefreq => 'yearly', :priority => 0.1
add "/news/tool-calculate-the-cost-and-benefits-of-training", :changefreq => 'yearly', :priority => 0.1
add "/news/when-an-employee-cant-return-to-work-after-an-fmla-leave", :changefreq => 'yearly', :priority => 0.1
add "/news/bitch-as-sexual-harassment-context-matters-sort-of", :changefreq => 'yearly', :priority => 0.1
add "/news/how-starbucks-impassions-workers-to-drive-growth", :changefreq => 'yearly', :priority => 0.1
add "/news/the-pros-and-cons-of-biometric-time-clocks", :changefreq => 'yearly', :priority => 0.1
add "/news/what-are-some-best-practices-for-rewriting-job-descriptions", :changefreq => 'yearly', :priority => 0.1
add "/news/the-new-hr-organization", :changefreq => 'yearly', :priority => 0.1
add "/news/awesome-influence-women-hr", :changefreq => 'yearly', :priority => 0.1
add "/news/a-handy-faq-for-service-animals-in-the-workplace", :changefreq => 'yearly', :priority => 0.1
add "/news/wetfeet-com%20and", :changefreq => 'yearly', :priority => 0.1
add "/news/what-is-the-difference-between-career-growth-and-career-devel, :changefreq => 'yearly', :priority => 0.1opment"
add "/news/ada-prescription-meds-need-know", :changefreq => 'yearly', :priority => 0.1
add "/news/coca-colas-staffing-philosophy-supports-its-global-strategy", :changefreq => 'yearly', :priority => 0.1
add "/news/staff-coverage", :changefreq => 'yearly', :priority => 0.1
add "/news/what-to-do-when-the-ceo-is-bully", :changefreq => 'yearly', :priority => 0.1
add "/news/hrs-role-in-the-reengineering-process", :changefreq => 'yearly', :priority => 0.1
add "/news/can-employer-require-employee-with-serious-health-condition-to-take-fmla-leave", :changefreq => 'yearly', :priority => 0.1
add "/news/how-do-parents-return-to-work-without-available-child-care", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-recover-a-stolen-computer-from-an-ex-employee-in-7-easy-steps", :changefreq => 'yearly', :priority => 0.1
add "/news/covid-19-and-no-fault-attendance-policies", :changefreq => 'yearly', :priority => 0.1
add "/news/how-short-staffed-resorts-can-optimize-scheduling", :changefreq => 'yearly', :priority => 0.1
add "/news/its-not-illegal-to-give-a-negative-job-reference-but", :changefreq => 'yearly', :priority => 0.1
add "/news/a-snack-sized-guide-to-lunch-break-laws", :changefreq => 'yearly', :priority => 0.1
add "/news/advice-on-answering-50-common-interview-questions", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-determine-weekly-work-hours-for-your-staff", :changefreq => 'yearly', :priority => 0.1
add "/news/the-pros-and-cons-of-the-most-common-timekeeping-systems-for-your-business", :changefreq => 'yearly', :priority => 0.1
add "/news/sample-phantom-stock-agreement", :changefreq => 'yearly', :priority => 0.1
add "/news/pros-and-cons-of-performance-appraisal-rating-systems", :changefreq => 'yearly', :priority => 0.1
add "/news/diversity-not-excuse-attack-white-people", :changefreq => 'yearly', :priority => 0.1
add "/news/aristotles-advice-for-business-success", :changefreq => 'yearly', :priority => 0.1
add "/news/4-ways-to-maximize-hr-and-wfm-data", :changefreq => 'yearly', :priority => 0.1
add "/news/decentralized-scheduling-in-nursing-helps-care-for-health-care-professionals", :changefreq => 'yearly', :priority => 0.1
add "/news/tips-for-restaurant-owners-on-getting-more-employee-feedback", :changefreq => 'yearly', :priority => 0.1
add "/news/how-to-use-technology-in-your-internal-communications-strategy", :changefreq => 'yearly', :priority => 0.1
add "/news/perks-at-work", :changefreq => 'yearly', :priority => 0.1
add  "/news/why-customer-satisfaction-starts-with-hr", :changefreq => 'yearly', :priority => 0.1
end

# index sitemap (add other sitemaps here)
SitemapGenerator::Sitemap.create index_sitemap_opts do
  add_to_index "sitemap.xml", :host => 'https://workforce.com'
  add_to_index "uk_sitemap.xml", :host => 'https://workforce.com' 
  add_to_index "news_sitemap.xml", :host => 'https://workforce.com'
end