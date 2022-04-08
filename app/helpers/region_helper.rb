module RegionHelper
  def unknown_region?
    params[:locale].blank?
  end

  def current_region
    uk? ? "uk" : "us"
  end

  def uk?
    params[:locale] == "uk" || cookies[:locale] == "uk"
  end

  def es?
    params[:locale] == "es"
  end

  def us?
    unknown_region? || params[:locale] == "us"
  end

  def usa?
    us?
  end
end
