class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy] 

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :situation_id, :delively_charge_id, :prefecture_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
  
end
