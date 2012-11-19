# Admins::RegistrationController
module Admins
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    before_filter :find_or_build_user, :only => :new

    def create
      build_resource
      resource.update_jabber(params)

      render :json => { :message => "Sent you a message" }
    end


  private
    #
    def find_or_build_user
      @user = (params[:id] ? User.find(params[:id]) : User.new)
    end
  end
end
