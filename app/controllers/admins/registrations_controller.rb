# Admins::RegistrationController
module Admins
  class RegistrationsController < Devise::RegistrationsController
    respond_to :html, :json

    before_filter :find_or_build_user, :only => :new

    # GET /users/sign_up
    def new
      respond_with do |format|
        format.json { render :json => @user.sign_up_hash }
        format.html
      end
    end

    def create
      super
      redirect_to :action => :new
    end



  private
    #
    def find_or_build_user
      @user = (params[:id] ? User.find(params[:id]) : User.new)
    end
  end
end
