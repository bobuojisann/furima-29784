class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
  end

  private

  def purchase_params
    params.require(:purchase).permit(:item_id).merge(user_id: current_user.id)

  end
    
end
