class ProjectionsController < ApplicationController
  def new
    @projection = Projection.new
  end

  def create
    @projection = Projection.create(projection_params)
    redirect_to @projection
  end
  
  def show
    @projection = Projection.find(params[:id]) 
    @btc_projection = JSON.parse(@projection.btc_projection)
    @eth_projection = JSON.parse(@projection.eth_projection)
  end

  private
  def projection_params
    params.require(:projection).permit(:amount)
  end
end
