# Admins::RegistrationController
module Admins
  class RegistrationsController < Devise::RegistrationsController
    respond_to :html, :json

    # TODO: y u do not run this action?

    # GET /users/sign_up
    def sign_up
      binding.pry

      @user ||= User.new
      @user.email = "foo@bar.baz"

      respond_with do |format|
        format.json { render :json => @user.sign_up_hash }
        format.html
      end
    end
  end
end
