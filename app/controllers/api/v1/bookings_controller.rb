class Api::V1::BookingsController < ApplicationController


  def create
    @ride = Ride.new(ride_params)
    if @ride.save
     render json: @ride, status: :created, location: api_v1_ride_url(@ride)
    else
     render json: @ride.errors, status: :unprocessable_entity
    end
  end

  def make_payment
    api_direct_payment

    # Build request object
    @do_direct_payment = @api.build_do_direct_payment({
      :DoDirectPaymentRequestDetails => {
        :PaymentAction => "Sale",
        :PaymentDetails => {
          :OrderTotal => Ride::RIDE_DETAIL[:OrderTotal],
          :NotifyURL => "http://localhost:3000/samples/merchant/ipn_notify" },
        :CreditCard => Rider::RIDER_DETAIL[1][:CreditCard] } })

    # Make API call & get response
    @response = @api.do_direct_payment(@do_direct_payment)

    # Access Response
    if @response.success?
      render json: {success: true, msg: @response.TransactionID}
    else
      render json: {success: false, msg: @response.Errors}
    end
  end


  private

  def rider_params
  	params.require(:ride).permit(:driver_id, :rider_id, :source, :destination)
  end

  def api_direct_payment
    require 'paypal-sdk-merchant'

    PayPal::SDK.configure(
      :mode      => "sandbox",  # Set "live" for production
      :app_id    => "APP-80W284485P519543T",
      :username  => "cheremacbook-facilitator2_api1_api1.gmail.com",
      :password  => "HKMHJQTT2CT5YJKC",
      :signature => "AzFmRN2alSXsVcRQ-bkJDjsW0iFTAwl.qaWoQtUIsTkqWuPDw-g-xK8R" )

    @api = PayPal::SDK::Merchant.new
  end
end
