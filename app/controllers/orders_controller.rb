class OrdersController < ApplicationController
  before_action :authenticate_user! # ログインしていないユーザーをログインページへ
  before_action :set_item           # 商品情報の取得
  before_action :move_to_index      # アクセス制限

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :post_code,
      :prefecture_id,
      :city,
      :address,
      :building_name,
      :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    # 以下の場合はトップページへリダイレクト
    # ・商品が売却済みの場合
    # ・出品者が購入しようとしている場合
    return unless @item.order.present? || current_user.id == @item.user_id

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
