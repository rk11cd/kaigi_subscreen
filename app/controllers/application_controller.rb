class ApplicationController < ActionController::Base
  protect_from_forgery

  def basic_authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == configatron.basic_authentication.username &&
        password == configatron.basic_authentication.password
    end
  end
end
