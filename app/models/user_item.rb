class UserItem
  include ActiveModel::Model
  attr_accessor :number, :cvc, :exp_month, :exp_year, :postal_cord, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :item_id 
    
  with_options presence:true do
   validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :phone_number, length: {maximum: 11}
  end
  validates :prefectures_id, numericality: { other_than: 1, message:  "can't be blank"}


  def save

    Purchase.create(item_id: item_id, user_id: current_user.id)
    ShippingAddress.create(postal_cord: postal_cord, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number,)
  end
end