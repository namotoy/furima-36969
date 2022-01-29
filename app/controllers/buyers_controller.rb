class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @buyer_address = BuyerAddress.new
    if @item.user == current_user 
      redirect_to root_path
    end
    if @item.user != current_user && @item.buyer.present? 
      redirect_to root_path
    end
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
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
  
  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  
    card: buyer_params[:token],    
    currency: 'jpy' 
  )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
