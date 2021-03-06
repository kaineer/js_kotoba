class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  rescue_from CanCan::AccessDenied, :with => :redirect_to_sign_in

  def default_url_options
    { :host => "localhost:3007" }
  end

protected
  #
  def redirect_to_sign_in
    redirect_to new_user_session_url
  end
end
