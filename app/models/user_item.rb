class UserItem
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を入力してください' }
    validates :municipalities
    validates :address
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'を入力してください' }
    validates :token
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_cord: postal_cord, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
