class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # ActiveStorage
  has_one_attached :image

  # ActiveHash アソシエーション
  belongs_to :user
  has_one    :order
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping

  # バリデーション
  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :image
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'は¥300~¥9,999,999の間で入力してください' }
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_id
  end
end
