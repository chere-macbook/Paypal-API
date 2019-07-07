class Api::V1::DriversController < ApplicationController



  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      render json: @driver.to_json
    else
      render json: @driver.errors.to_json
    end
  end


  private

  def driver_params
    params.require(driver).permit(:name, :age, :car_number)
  end

end
