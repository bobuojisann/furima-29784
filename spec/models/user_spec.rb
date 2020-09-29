require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it '全てのフォームが空でなければ登録できる' do
        expect(@user).to be_valid
      end

      it 'first_nameが全角、漢字、カタカナ、ひらがなだと登録できる' do
        @user.first_name = 'たカ人'
        expect(@user).to be_valid
      end

      it 'last_nameが全角、漢字、カタカナ、ひらがなだと登録できる' do
        @user.last_name = 'しン助'
        expect(@user).to be_valid
      end

      it 'first_name_furiganaがカタカナだと登録できる' do
        @user.first_name_furigana = 'タカジン'
        expect(@user).to be_valid
      end

      it 'last_name_furiganaがカタカナだと登録できる' do
        @user.first_name_furigana = 'シンスケ'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank")
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'ueer.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid. Input full-width characters.')
      end
      it 'first_nameが全角かつ、漢字、平仮名、カタカナでなければ登録できない' do
        @user.first_name = 'uru;:'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid. Input full-width characters.')
      end
      it 'last_nameが全角かつ、漢字、平仮名、カタカナでなければ登録できない' do
        @user.last_name = 'uru;:'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_name_furiganaが空だと登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank", 'First name furigana is invalid. Input full-width katakana characters.')
      end
      it 'first_name_furiganaがカタカナでなければ登録できない' do
        @user.first_name_furigana = 'たがわ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furigana is invalid. Input full-width katakana characters.')
      end
      it 'last_name_furiganaが空だと登録できない' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank", 'Last name furigana is invalid. Input full-width katakana characters.')
      end
      it 'last_name_furiganaがカタカナでなければ登録できない' do
        @user.last_name_furigana = 'たがわ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name furigana is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", 'Password is too short (minimum is 6 characters)')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'paswordが６文字以上でないと登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is too short (minimum is 6 characters)', 'Password is too short (minimum is 6 characters)')
      end
    end
  end
end