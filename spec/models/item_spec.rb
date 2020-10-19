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
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'commentが空だと登録できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("コメントを入力してください")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'category_idが--だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'product_condition_idが--だと登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'delivery_fee_idが--だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'area_idが--だと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("地域を入力してください")
      end
      it 'date_of_shipment_idが--だと登録できない' do
        @item.date_of_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格を半角数字で入力してください", "販売価格を300~9,999,999の間で入力してください")
      end
      it 'priceが299以下だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を300~9,999,999の間で入力してください")
      end
      it 'priceが10,000,000以上だと登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を300~9,999,999の間で入力してください")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を300~9,999,999の間で入力してください")
      end
    end
  end
end
