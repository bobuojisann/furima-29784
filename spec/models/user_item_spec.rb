require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
  end

  describe '商品購入機能' do
    context '商品購入がうまく行く時' do
      it '全てのフォームが空でなければ登録できる' do
        expect(@user_item).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @user_item.building_name = ''
        @user_item.valid?
        expect(@user_item).to be_valid
      end
    end

    context '商品購入がうまく行かない時' do
      it 'postal_cordが空のとき購入できない' do
        @user_item.postal_cord = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("郵便番号を入力してください", "郵便番号を入力してください")
      end
      it 'postal_cordにハイフンがないとき購入できない' do
        @user_item.postal_cord = '1144888'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'municipalitiesが空のとき購入できない' do
        @user_item.municipalities = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空のとき購入できない' do
        @user_item.address = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空のとき購入できない' do
        @user_item.phone_number = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("電話番号を入力してください", "電話番号を入力してください")
      end
      it 'phone_numberにハイフンが入っていると登録できない' do
        @user_item.phone_number = '06-666-4444'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @user_item.phone_number = '090333300000'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it 'tokenが空のとき購入できない' do
        @user_item.token = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Tokenを入力してください")
      end
      it 'prefectures_idが空のとき購入できない' do
        @user_item.prefectures_id = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'prefectures_idが１のとき購入できない' do
        @user_item.prefectures_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("都道府県を入力してください")
      end
    end
  end
end
