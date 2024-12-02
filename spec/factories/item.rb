FactoryBot.define do
  factory :item do
    product_name { 'テスト商品' }
    info { 'テスト商品説明' }
    price { 500 }
    category_id { 2 }
    sales_status_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
