class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :comment
    validates :category_id
    validates :product_condition_id
    validates :deilve_fee_id
    validates :area_id
    validates :date_of_shipment_id
    validates :price format:{with: /^[0-9]+$/, message: "半角数字のみ入力可能"}
  end

  validates :price numerricality:{:greater_than : 300, :less_than_or_equal_to : 9999999 message:"300円~999999円の間で入力"}
end


