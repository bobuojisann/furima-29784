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
    # validates :category_id
    # validates :product_condition_id
    # validates :delivery_fee_id
    # validates :area_id
    # validates :date_of_shipment_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Peice Half-width number' }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :date_of_shipment_id
  end
  validates :price, numericality: { greater_than: 300, less_than_or_equal_to: 9_999_999, message: 'Price Out of setting range' }
end
