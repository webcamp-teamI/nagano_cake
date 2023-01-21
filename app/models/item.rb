class Item < ApplicationRecord
<<<<<<< HEAD
  has_one_attached :image
=======
    has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre
>>>>>>> 6386ea20417346ac1badf901b93f7ed2cc662560
end
