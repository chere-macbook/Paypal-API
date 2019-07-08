class Rider < ApplicationRecord

  RIDER_DETAIL =
    { 1 =>  {
        name: 'John Doe',
        email: 'jane@hotmail.com',
        contact_number: 8887665776,
        :CreditCard => {
          :CreditCardType => "Visa",
          :CreditCardNumber => "4904202183894535",
          :ExpMonth => 12,
          :ExpYear => 2022,
          :CVV2 => "962"
      }
    }
  }


  validates :name, presence: true

end
