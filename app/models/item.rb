class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :date_of_shipment
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :comment
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' }
  end
  with_options numericality: { other_than: 1, message: 'を入力してください' } do
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :date_of_shipment_id
  end
  validates :price, numericality: { greater_than: 300, less_than_or_equal_to: 9_999_999, message: 'を300~9,999,999の間で入力してください' }
end
