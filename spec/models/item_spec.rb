require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる場合' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像が添付されていなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end

      it '商品の状態が空では出品できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status を選択してください')
      end

      it '配送料の負担が空では出品できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost を選択してください')
      end

      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を選択してください')
      end

      it '発送までの日数が空では出品できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping を選択してください')
      end

      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の間で入力してください')
      end

      it '価格が¥10,000,000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の間で入力してください')
      end

      it '価格が半角数値でなければ出品できない' do
        @item.price = '１０００'
        @item.valid?

        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の間で入力してください')
      end
    end
  end
end
