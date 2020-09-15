class ApplicationController < ActionController::Base
  layout :set_layout

  rescue_from StandardError, with: :rescue500
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  private def set_layout
    if params[:controller].match(%r{\A(admin|teacher|student)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end

  private def rescue404(e)
    render "errors/not_found", status: 404
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
