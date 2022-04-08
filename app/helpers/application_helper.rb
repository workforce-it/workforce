module ApplicationHelper
  include TranslationHelper

  def page_title
    title_for_this_page = content_for?(:title) ? content_for(:title).strip : nil
    [
      title_for_this_page,
      "Workforce.com"
    ].compact.join(" | ").html_safe
  end

  def page_description
  	description_for_this_page = content_for?(:description) ? content_for(:description).strip : nil
  end
end
