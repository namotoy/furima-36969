class BuyersController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :block_number, :building_name, :telephone_number,:number, :exp_month, :exp_year, :cvc, :price, :token).merge(user_id: current_user.id, item_id: @item.id)
  end


end
