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

has_many :users_items
has_many :items, through: :users_items

# itemsテーブル

｜Column           ｜Type       ｜Options                        ｜
｜-----------------｜-----------｜-------------------------------｜
｜name             ｜string     ｜null: false                    ｜
｜comment          ｜text       ｜null: false                    ｜
｜category         ｜integer    ｜null: false                    ｜
｜product_condition｜integer    ｜null: false                    ｜
｜delivery_fee     ｜integer    ｜null: false                    ｜
｜area             ｜string     ｜null: false                    ｜
｜date_of_shipment ｜integer    ｜null: false                    ｜
｜price            ｜integer    ｜null: false                    ｜
｜user             ｜reference  ｜null: false, foreign_key: true ｜
### Association

has_many :users_items
has_many :users, through: :users_items
has_one_attached:image

# users_itemsテーブル
｜Column       ｜Type        ｜Options                       ｜
｜user         ｜reference   ｜null: false, foreign_key: true｜
｜items        ｜reference   ｜null: false, foreign_key: true｜

### Association

belongs_to :user
belongs_to :item
belongs_to :purchase

# purchase

｜Column          ｜Type         ｜Options                       ｜
｜----------------｜-------------｜------------------------------｜
｜card            ｜integer      ｜null: false                   ｜
｜expiration      ｜integer      ｜null: false                   ｜
｜security_cord   ｜integer      ｜null: false                   ｜
｜user            ｜reference    ｜null: false, foreign_key: true｜
｜items           ｜reference    ｜null: false, foreign_key: true｜

### Association
has_one :shipping_address
has_many :users_items

# shipping_address

｜Column          ｜Type        ｜Options                       ｜
｜postal_cord     ｜integer     ｜null: false                   ｜
｜prefectures     ｜integer     ｜null:false                    ｜
｜municipalities  ｜string      ｜null: false                   ｜
｜address         ｜integer     ｜null: false                   ｜
｜building_name   ｜string      ｜                              ｜
｜phone_number    ｜string      ｜null: false                   ｜
｜purchase        ｜reference   ｜null: false, foreign_key: true｜


### Association

belongs_to :purchase
