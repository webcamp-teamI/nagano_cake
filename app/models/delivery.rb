class Delivery < ApplicationRecord
    belongs_to :customer
def address_display
  '〒' + address_number + ' ' + address + ' ' + address_name
end
end
