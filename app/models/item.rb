class Item < ApplicationRecord
    has_one_attached :image

    has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre

    def get_item_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
        item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      item_image.variant(resize_to_limit: [width, height]).processed
    end

end
