# テーブル設計

# usersテーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false |
| birthday          | date   | null: false |
| last_name         | string | null: false |
|first_name         | string | null: false |
|last_name_furigana | string | null: false |
|first_name_furigana| string | null: false |
| email             | string | null: false |
| password          | string | null: false |


### Association

has_many :items
has_many :purchases

# itemsテーブル

｜Column           ｜Type       ｜Options                        ｜
｜-----------------｜-----------｜-------------------------------｜
｜name             ｜string     ｜null: false                    ｜
｜comment          ｜text       ｜null: false                    ｜
｜category_id      ｜integer    ｜null: false                    ｜
｜product_condition｜integer    ｜null: false                    ｜
｜delivery_fee     ｜integer    ｜null: false                    ｜
｜area_id          ｜integer    ｜null: false                    ｜
｜date_of_shipment ｜integer    ｜null: false                    ｜
｜price            ｜integer    ｜null: false                    ｜
｜user             ｜reference  ｜null: false, foreign_key: true ｜
### Association

belongs_to user
has_one :purchase
# has_one_attached:image

# purchasesテーブル
｜Column       ｜Type        ｜Options                       ｜
｜user         ｜reference   ｜null: false, foreign_key: true｜
｜item         ｜reference   ｜null: false, foreign_key: true｜

### Association

belongs_to :user
belongs_to :item
has_one :shipping_address

# shipping_addresses

｜Column          ｜Type        ｜Options                       ｜
｜postal_cord     ｜string      ｜null: false                   ｜
｜prefectures_id  ｜integer     ｜null:false                    ｜
｜municipalities  ｜string      ｜null: false                   ｜
｜address         ｜string      ｜null: false                   ｜
｜building_name   ｜string      ｜                              ｜
｜phone_number    ｜string      ｜null: false                   ｜
｜purchase        ｜reference   ｜null: false, foreign_key: true｜

### Association
belongs_to :purchase



