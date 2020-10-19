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
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'ueer.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'emailが同じメールアドレスだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字を全角で入力してください")
      end
      it 'first_nameが全角かつ、漢字、平仮名、カタカナでなければ登録できない' do
        @user.first_name = 'uru;:'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を全角で入力してください")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前を全角で入力してください")
      end
      it 'last_nameが全角かつ、漢字、平仮名、カタカナでなければ登録できない' do
        @user.last_name = 'uru;:'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を全角で入力してください")
      end
      it 'first_name_furiganaが空だと登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください", "名字カナを全角カタカナで入力してください")
      end
      it 'first_name_furiganaがカタカナでなければ登録できない' do
        @user.first_name_furigana = 'たがわ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを全角カタカナで入力してください")
      end
      it 'last_name_furiganaが空だと登録できない' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください", "名前カナを全角カタカナで入力してください")
      end
      it 'last_name_furiganaがカタカナでなければ登録できない' do
        @user.last_name_furigana = 'たがわ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを全角カタカナで入力してください")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'paswordが６文字以上でないと登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
    end
  end
end
