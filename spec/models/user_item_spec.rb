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
        expect(@user_item.errors.full_messages).to include("Postal cord can't be blank", 'Postal cord is invalid. Include hyphen(-)')
      end
      it 'postal_cordにハイフンがないとき購入できない' do
        @user_item.postal_cord = '1144888'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Postal cord is invalid. Include hyphen(-)')
      end
      it 'municipalitiesが空のとき購入できない' do
        @user_item.municipalities = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空のとき購入できない' do
        @user_item.address = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空のとき購入できない' do
        @user_item.phone_number = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが入っていると登録できない' do
        @user_item.phone_number = '06-666-4444'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Phone number Peice Half-width number')
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @user_item.phone_number = '090333300000'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空のとき購入できない' do
        @user_item.token = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefectures_idが空のとき購入できない' do
        @user_item.prefectures_id = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'prefectures_idが１のとき購入できない' do
        @user_item.prefectures_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefectures can't be blank")
      end
    end
  end
end
