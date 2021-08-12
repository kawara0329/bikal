class BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end

  def new
  end
  
  private

  def bike_params
    params.require(:bike).permit(:content, :image).merge(user_id: current_user.id)
  end
end
