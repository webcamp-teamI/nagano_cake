class OrderDetail < ApplicationRecord
    enum make_status: { cannot_be_manufactured: 0, waiting_for_production: 1, in_production: 2, completion_of_production: 3}
    
    belongs_to :order
    belongs_to :item
end
