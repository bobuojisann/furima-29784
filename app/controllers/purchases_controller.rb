class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_user_redirect
  before_action :purchased_item_redirect

  def index
    @item = Item.find(params[:item_id])
    @user_item =UserItem.new
  end


  def create
    # binding.pry
    @user_item = UserItem.new(purchase_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_item).permit(:postal_cord, :prefectures_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])

  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end


  # def purchased_item_redirect
  #   @item = Item.find(params[:item_id])
  #   @item.purchase
  #   @purchase = Purchase.find_by(item_id: params[:item_id])
  #   unless @item.id != @purchase.item_id
  #     redirect_to root_path
  #   end
  # end

  def purchased_item_redirect
    @item = Item.find(params[:item_id])
    if @item.purchase
      redirect_to root_path
    end
  end

    def item_user_redirect
      @item = Item.find(params[:item_id])
      unless @item.user_id != current_user.id
        redirect_to root_path
      end
    end
end
