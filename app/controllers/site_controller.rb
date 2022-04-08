class SiteController < ApplicationController
  include RegionHelper

  # core pages
  def index
  end

  def how_it_works
  end

  def role_by_role
  end

  def before_and_after
  end

  def why_different
  end

  def customers
  end

  def pricing
  end

  def contact
  end

  # seo pages
  def scheduling
    if uk? && request.path.include?("/software/scheduling-software")
      return redirect_to(software_rota_path(locale: "uk"), status: :moved_permanently)
    end

    if us? && request.path.include?("/software/rota")
      return redirect_to(software_rota_path(locale: "uk"), status: :moved_permanently)
    end

    @canonical = "/software/scheduling-software"
    @uk_alternate = "/uk/software/rota"
    @us_alternate = "/software/scheduling-software"
  end

  def attendance
  end

  def employee_app
  end

  def timeclock_app
  end

  def employee_onboarding
  end

  def compliance
  end

  def payroll
  end

  def communications
  end

  def hospitality
  end

  def staffing
  end

  def restaurants_and_bars
  end

  def hospitals
  end

  def call_centers
  end

  def construction
  end

  def elder_care
  end

  def healthcare
  end

  def hotels
  end

  def manufacturing
  end

  def retail
  end

  def franchise
  end

  # footer pages
  def privacy_policy
    if uk?
      render "privacy_policy_uk"
    else
      render "privacy_policy"
    end
  end

  def cookies_page
  end
  
  def terms
    if uk?
      render "terms_uk"
    else
      render "terms_us"
    end
  end

  def security
  end

  def biometric
  end

  def gdpr
  end
end
