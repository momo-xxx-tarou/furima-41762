class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :info, :price, :image, :category_id, :sales_status_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_id).merge(user_id: current_user.id)
  end
end
