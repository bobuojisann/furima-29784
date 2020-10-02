require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
  end 

  describe '商品出品機能' do

    context '商品が出品できるとき' do
      it '全てのフォームが空でなければ出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'commentが空だと登録できない' do
        @item.comment = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'category_idが--だと登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'product_condition_idが--だと登録できない' do
        @item.product_condition_id = ""
        @item.valid?

        expect(@item.errors.full_messages).to include("Product condition is not a number")
      end
      it 'delivery_fee_idが--だと登録できない' do
        @item.delivery_fee_id= ""
        @item.valid?
     
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end
      it 'area_idが--だと登録できない' do
        @item.area_id = ""
        @item.valid?

        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it 'date_of_shipment_idが--だと登録できない' do
        @item.date_of_shipment_id = ""
        @item.valid?

        expect(@item.errors.full_messages).to include("Date of shipment is not a number")
      end
      it 'priceが空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300~9,999,999の値でないと登録できない' do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting range")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = "８８８"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting range")
      end
    end
  end
end