# テーブル設計

# usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| birthday |integer | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |


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

### Association

has_many :users_items
has_many :users, through: :users_items
has_one_attached:image

# users_itemsテーブル
｜Column          ｜Type        ｜Options                       ｜
｜user_id         ｜reference   ｜null: false, foreign_key: true｜
｜items_id        ｜reference   ｜null: false, foreign_key: true｜

### Association

belongs_to :user
belongs_to :item
belongs_to :shipping_address

# purchase

｜Column          ｜Type        ｜Options                       ｜
｜----------------｜------------｜------------------------------｜
｜card            ｜string      ｜null: false                   ｜
｜expiration      ｜string      ｜null: false                   ｜
｜security_cord   ｜string      ｜null: false                   ｜

### Association
has_one :shipping_address

# shipping_address

｜Column          ｜Type        ｜Options                       ｜
｜postal_cord     ｜integer     ｜null: false                   ｜
｜prefectures     ｜integer     ｜null:false                    ｜
｜municipalities  ｜string      ｜null: false                   ｜
｜address         ｜integer     ｜null: false                   ｜
｜building_name   ｜string      ｜                              ｜
｜phone_number    ｜string      ｜null: false                   ｜
｜user            ｜reference   ｜null: false, foreign_key: true｜
｜item            ｜reference   ｜null: false, foreign_key: true｜

### Association

belongs_to :purchase
has_many :users_items