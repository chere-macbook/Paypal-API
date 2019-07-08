class Driver < ApplicationRecord

  DRIVER_DETAIL = {
    1 => {
      name: 'Kishore',
      age: 35
    }
  }

  validates :name, presence: true
end
