FactoryBot.define do
  factory :item do
    name                    {'アイテム'}
    comment                 {'アイテム'}
    image                 {Faker::Lorem.sentence}
    category_id             {2}
    product_condition_id    {2}
    delivery_fee_id         {2} 
    area_id                 {2}
    date_of_shipment_id     {2}
    price                   {9999999}
    association :user
  end
end
