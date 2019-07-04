class PaypalController < ApplicationController
  def index
    PayPal::SDK.configure(
      :mode      => "sandbox",
      :app_id    => "APP-80W284485P519543T",
      :username  => "cheremacbook-facilitator_api1.gmail.com",
      :password  => "TKXE8Z9N3NBXHE22",
      :signature => "APRsl41frcRN4wLKAFMK7LzISTweApuRw.M3L6FzX.bsQ.IuPX.Efv9u" )

    @api = PayPal::SDK::Merchant.new

    # Build request object
    @do_direct_payment = @api.build_do_direct_payment({
      :DoDirectPaymentRequestDetails => {
        :PaymentAction => "Sale",
        :PaymentDetails => {
          :OrderTotal => {
            :currencyID => "INR",
            :value => "1" },
          :NotifyURL => "http://localhost:3000/samples/merchant/ipn_notify" },
        :CreditCard => {
          :CreditCardType => "Visa",
          :CreditCardNumber => "4904202183894535",
          :ExpMonth => 12,
          :ExpYear => 2022,
          :CVV2 => "962" } } })

    # Make API call & get response
    @response = @api.do_direct_payment(@do_direct_payment)

    # Access Response
    if @response.success?
      Rails.logger.info "Result : " + @response.TransactionID
    else
      Rails.logger.info "Result : " + @response.Errors
    end
  end
end
