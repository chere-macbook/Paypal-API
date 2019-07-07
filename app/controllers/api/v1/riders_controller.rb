class Api::V1::RidersController < ApplicationController
	# POST /articles
  def create
   @rider = Rider.new(rider_params)
   if @rider.save
    render json: @rider, status: :created, location: api_v1_rider_url(@rider)
   else
    render json: @rider.errors, status: :unprocessable_entity
   end
  end

  # PATCH/PUT /articles/1
  def update
   if @rider.update(rider_params)
    render json: @rider
   else
    render json: @rider.errors, status: :unprocessable_entity
   end
  end

  private

  # Only allow a trusted parameter “white list” through.
  def rider_params
  	params.require(:rider).permit(:name, :age, :contact_number)
  end
end