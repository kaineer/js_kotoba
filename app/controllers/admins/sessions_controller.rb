module Admins
  class SessionsController < Devise::SessionsController
    respond_to :json

    def new
      resource = build_resource(nil, :unsafe => true)
      clean_up_passwords(resource)
      
      render :json => { :data => resource.sign_in_hash }
    end

    def create
    end
  end
end
