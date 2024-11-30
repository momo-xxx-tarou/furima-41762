require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系' do
      it 'すべての情報が適切に入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'メールアドレスが一意でなければ登録できない' do
        duplicate_user = FactoryBot.create(:user, email: @user.email)
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角英数字混合でなければ登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードとパスワード（確認）は一致していなければ登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = 'different123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は名字と名前がそれぞれ必須である' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Last name can't be blank",
          "First name can't be blank"
        )
      end

      it 'お名前(全角)は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'yamada'
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Last name 全角文字を使用してください',
          'First name 全角文字を使用してください'
        )
      end

      it 'お名前カナ(全角)は名字と名前がそれぞれ必須である' do
        @user.last_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include(
          "Last name kana can't be blank",
          "First name kana can't be blank"
        )
      end

      it 'お名前カナ(全角)は全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Last name kana 全角カタカナを使用してください',
          'First name kana 全角カタカナを使用してください'
        )
      end

      it '生年月日が必須である' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
