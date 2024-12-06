class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた正しい形式で入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
  end

  def save
    # 購入記録を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    ShippingAddress.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
