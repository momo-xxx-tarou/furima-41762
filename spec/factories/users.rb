FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '山田' } # 全角（漢字）
    first_name            { '太郎' } # 全角（漢字）
    last_name_kana        { 'ヤマダ' } # 全角（カタカナ）
    first_name_kana       { 'タロウ' } # 全角（カタカナ）
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) } # 生年月日
  end
end
