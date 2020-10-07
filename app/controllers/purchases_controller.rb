class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_item =UserItem.new
  end


  def create
    @user_item = UserItem.create(purchase_params)
   
  end

  private

  def purchase_params
    params.require(:user_item).permit(:postal_cord, :prefectures_id, :municipalities, :address, :building_name, :phone_number,:itemid).merge(user_id: current_user.id, token: params[:token])

  end
    
end
