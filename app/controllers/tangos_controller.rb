class TangosController < ApplicationController
  #
  load_and_authorize_resource

  respond_to :json

  # GET /tangos(.:format)
  def index
    render :json => Tango.limit(params[:limit] || 100).all
  end

  # GET /tangos/:id(.:format)
  def show
    render :json => Tango.find(params[:id])
  end
end
