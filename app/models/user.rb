class User < ApplicationRecord
  # アソシエーション
  has_many :items
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :birthday, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
