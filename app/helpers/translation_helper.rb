module TranslationHelper
  include RegionHelper

  # call these methods instead of hard coding words
  # for example, don't say:
  #
  #  <p> Workforce.com has great schedules! </p>
  #
  # instead say:
  #
  #  <p> Workforce.com has great <%= schedules %>! </p>
  #
  # that way it will say "rotas" instead for the UK.
  # if you add new translation helpers, please update the README too!
  def schedule
    translate uk: "rota", us: "schedule"
  end

  def schedules
    translate uk: "rotas", us: "schedules"
  end

  def leave_requests
    translate uk: "time off requests", us: "PTO requests"
  end

  def labor
    translate uk: "labour", us: "labor"
  end
  
  def optimize
    translate uk: "optimise", us: "optimize"
  end
  
  def optimized
    translate uk: "optimised", us: "optimized"
  end
  
  def translate(uk:, us:)
    if us?
      us
    elsif uk?
      uk
    else
      us
    end
  end
end
