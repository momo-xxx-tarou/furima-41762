FactoryBot.define do
  factory :shipping_address do
    post_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    address { "MyString" }
    building_name { "MyString" }
    phone_number { "MyString" }
    order { nil }
  end
end
