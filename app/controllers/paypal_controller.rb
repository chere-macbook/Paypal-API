require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

class PaypalController < ApplicationController
  skip_before_action :verify_authenticity_token


  def checkout
    @payment = Payment.new(payment_details)

    # Create Payment and return status
    if @payment.create
      render json: {success: true, paymentID: @payment.id}
    else
      render json: {success: false}
    end
  end

  def execute
    payment = PayPal::SDK::REST::Payment.find(permited_payment_details[:paymentID])

    if payment.execute(payer_id: permited_payment_details[:payerID])
      render json: { success: true, msg: "Payment Complete for #{permited_payment_details[:paymentID]}" }
    else
      render json: { success: false, msg: payment.error }
    end
  end

  private


  def permited_payment_details
    params.permit(:paymentID, :payerID)
  end

  def payment_details
    {
      :intent =>  "sale",

      # ###Payer
      # A resource representing a Payer that funds a payment
      # Payment Method as 'paypal'
      :payer =>  {
        :payment_method =>  "paypal" },

      # ###Redirect URLs
      :redirect_urls => {
        :return_url => "http://localhost:3000/execute",
        :cancel_url => "http://localhost:3000/" },

      # ###Transaction
      # A transaction defines the contract of a
      # payment - what is the payment for and who
      # is fulfilling it.
      :transactions =>  [{

        # Item List
        :item_list => {
          :items => [{
            :name => "item",
            :sku => "item",
            :price => "0.01",
            :currency => "USD",
            :quantity => 1 }]},

        # ###Amount
        # Let's you specify a payment amount.
        :amount =>  {
          :total =>  "0.01",
          :currency =>  "USD" },
        :description =>  "This is the payment transaction description." }
      ]
    }
  end
end
