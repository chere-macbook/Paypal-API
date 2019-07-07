class Api::V1::RidersController < ApplicationController

	# POST /articles
  def create
   @rider = Rider.new(rider_params)
   if @rider.save
    render json: @rider, status: :created, location: api_v1_rider_index_url(@rider)
   else
    render json: @rider.errors, status: :unprocessable_entity
   end
  end

  private

  def rider_params
  	params.require(:rider).permit(:name, :email, :contact_number)
  end
end
