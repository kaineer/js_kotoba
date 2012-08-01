# Admins::RegistrationController
module Admins
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    before_filter :find_or_build_user, :only => :new

    # GET /users/sign_up
    def new
      render :json => @user.sign_up_hash
    end

    def create
      build_resource

      if resource.save
        if resource.active_for_authentication?
          sign_in(resource_name, resource)
          render :json => {:user => resource}
        else
          render :json => {:message => "Need to confirm email"}
        end
      else
        clean_up_passwords(resource)
        render :json => {:redirect_to => "users/sign_up", :errors => resource.errors}
      end
    end


  private
    #
    def find_or_build_user
      @user = (params[:id] ? User.find(params[:id]) : User.new)
    end
  end
end
