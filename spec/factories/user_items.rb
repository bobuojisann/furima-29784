FactoryBot.define do
  factory :user_item do
    number                         { '424242424242424242' }
    cvc                            { '123' }
    exp_month                      { '4' }
    exp_year                       { '23' }
    postal_cord                    { '111-4333' }
    municipalities                 { '茨城市' }
    address                        { '13-13' }
    building_name                  { '鈴木ビル' }
    phone_number                   { '09022223333' }
    token                          { 'hoouoosusojoeuoruooo' }
    prefectures_id                 { 3 }
  end
end
