# Admins::RegistrationController
module Admins
  class RegistrationsController < Devise::RegistrationsController
    respond_to :html, :json

    # GET /users/sign_up
    def sign_up
      @user ||= User.new
      @user.email = "foo@bar.baz"

      respond_with do |format|
        format.json { render :json => @user.sign_up_hash }
      end
    end
  end
end
