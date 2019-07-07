class Api::V1::DriversController < ApplicationController



  def create
    @driver = Driver.new(driver_params)

    if @driver.save
     render json: @driver, status: :created, location: api_v1_drivers_url(@driver)
    else
     render json: @driver.errors, status: :unprocessable_entity
    end
  end


  private

  def driver_params
    params.require(driver).permit(:name, :age, :car_number)
  end

end
