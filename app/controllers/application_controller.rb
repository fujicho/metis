class ApplicationController < ActionController::Base
  layout :set_layout

  include ErrorHandlers if Rails.env.production?

  private def set_layout
    if params[:controller].match(%r{\A(teacher|student)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end
