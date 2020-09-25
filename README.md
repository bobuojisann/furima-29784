# テーブル設計

# usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

has_many :item
belongs_to :purchase

# itemsテーブル

｜Column           ｜Type       ｜Options                        ｜
｜-----------------｜-----------｜-------------------------------｜
｜item             ｜string     ｜null: false                    ｜
｜comment          ｜string     ｜null: false                    ｜
｜category         ｜string     ｜null: false                    ｜
｜product_condition｜string     ｜null: false                    ｜
｜delivery_fee     ｜integer    ｜null: false                    ｜
｜area             ｜string     ｜null: false                    ｜
｜date_of_shipment ｜integer    ｜null: false                    ｜
｜price            ｜integer    ｜null: false                    ｜
｜user             ｜references ｜null: false, foreign_key: true ｜

### Association

belongs_to :users
belongs_to :purchase
has_one_attached:image

# purchase

｜Column          ｜Type        ｜Options                       ｜
｜----------------｜------------｜------------------------------｜
｜card            ｜string      ｜null: false                   ｜
｜expiration      ｜string      ｜null: false                   ｜
｜security_cord   ｜string      ｜null: false                   ｜
｜shipping_address｜string      ｜null: false                   ｜
｜postal_cord     ｜integer     ｜null: false                   ｜
｜municipalities  ｜string      ｜null: false                   ｜
｜address         ｜integer     ｜null: false                   ｜
｜building_name   ｜string      ｜                              ｜
｜phone_number    ｜integer     ｜null: false                   ｜
｜user            ｜references  ｜null: false, foreign_key: true｜
｜item            ｜references  ｜null: false, foreign_key: true｜

### Association

has one user
has one item