class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :email
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :last_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力してください' }
    validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力してください' }
    validates :birthday
    validates :password, length: { minimum: 6 }
  end
end
