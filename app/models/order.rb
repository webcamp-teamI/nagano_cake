class Order < ApplicationRecord
    has_one_attached :image
    
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum pay_style: { credit_card: 0, transfer: 1 }
    enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }
    
    def get_item_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpeg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      image.variant(resize_to_limit: [width, height]).processed
    end
    
end
