class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :item_user_redirect
  before_action :purchased_item_redirect

  def index
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(purchase_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_item).permit(:postal_cord, :prefectures_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchased_item_redirect
    redirect_to root_path if @item.purchase
  end

  def item_user_redirect
    redirect_to root_path if @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
