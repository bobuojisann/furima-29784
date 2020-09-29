FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 3) }
    email { Faker::Internet.free_email}
    first_name                {'田ガわ'}
    last_name                 {'敦ひコ'}
    first_name_furigana       {'タガワ'}
    last_name_furigana        {'アツヒコ'}
    birthday {Faker::Date.birthday(min_age: 20, max_age: 65)}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
