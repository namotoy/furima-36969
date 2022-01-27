class BuyersController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      Payjp.api_key = "sk_test_60846bab379c401e903b2271" 
      Payjp::Charge.create(
        amount: @item.price,  
        card: buyer_params[:token],    
        currency: 'jpy' 
      )
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :block_number, :building_name, :telephone_number,:number, :exp_month, :exp_year, :cvc, :price).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end


end
