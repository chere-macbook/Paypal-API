class Api::V1::RidersController < ApplicationController
	before_action :set_rider, only: [:show, :update]

	# POST /articles
  def create
   @rider = Rider.new(rider_params)
   if @rider.save
    render json: @rider, status: :created, location: api_v1_rider_url(@rider)
   else
    render json: @rider.errors, status: :unprocessable_entity
   end
  end

  # GET /articles/1
  def show
   render json: @rider
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

  # Use callbacks to share common setup or constraints between actions.
  def set_rider
  	@rider = Rider.find(params[:id])
  end

  # Only allow a trusted parameter “white list” through.
  def rider_params
  	params.require(:rider).permit(:name, :email, :contact_number)
  end
end