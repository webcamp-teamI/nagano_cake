class Item < ApplicationRecord
    has_one_attached :image

    has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre

    def get_item_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpeg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      image.variant(resize_to_limit: [width, height]).processed
    end

        ## 消費税を求めるメソッド
    def with_tax_price
      (tax_free * 1.1).floor
    end




end
