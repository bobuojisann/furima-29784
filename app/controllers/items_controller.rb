class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
     @items = Item.new
  end

  def show

  end

  def create
    @item =Item.new(item_params)
    if@article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name,:comment,:caetgory_id,:product_condition,:delivery_fee_id,:area_id,:date_of_shipment_id,:price,:image).merge(user_id: current_user.id)
  end
end
