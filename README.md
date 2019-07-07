# README


This is as basic Paypal Checkout Button sample code

Install the Rails Application

1 visit : localhost:3000

2. Create Rider

```
POST https://localhost:3000/api/v1/riders

{
"name": "Jane Doe",
"email": "jane@hotmail.com",
"contact_number": "888877665"
}
```

```
POST https://localhost:3000/api/v1/bookings/:id/make_payment

{
  :DoDirectPaymentRequestDetails=>
  {
    :PaymentAction=>"Sale",
    :PaymentDetails=>
    {
      :OrderTotal=>{:currencyID=>"USD", :value=>"5"},
      :NotifyURL=>"http://localhost:3000/samples/merchant/ipn_notify"
    },
    :CreditCard=>
    {
      :CreditCardType=>"Visa",
      :CreditCardNumber=>"4904202183894535",
      :ExpMonth=>12,
      :ExpYear=>2022,
      :CVV2=>"962"
    }
  }
}
```

# NOTE
On Success it will popup with paymentID

On Failure it will popup error message
