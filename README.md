## usersテーブル

|Column               | Type        |Options                 |
|---------------------|------------ |------------------------|
|nickname             |string       |null: false             |
|email                |string       |null: false,unique:true |
|encrypted_password   |string       |null: false             |
|last_name            |string       |null: false             |
|first_name           |string       |null: false             |
|last_name_kana       |string       |null: false             |
|first_name_kana      |string       |null: false             |
|birthday             |date         |null: false             |
 

-has_many :items
-has_many :buyers

## itemsテーブル
|Column             | Type     |Options                      |
|-------------------|----------|-----------------------------|
|title              |string    |null: false                  |
|explanation        |text      |null: false                  |
|category_id        |integer   |null: false                  |
|situation_id       |integer   |null: false                  |
|delively_charge_id |integer   |null: false                  |
|prefecture_id      |integer   |null: false                  |
|shipping_days_id   |integer   |null: false                  |
|price              |integer   |null: false                  |
|user               |references|null: false,foreign_key: true|

-belongs_to :user
-has_one :buyer

## buyersテーブル
|Column     | Type     |Options                      |
|-----------|----------|-----------------------------|
|item       |references|null: false,foreign_key: true|
|user       |references|null: false,foreign_key: true|

-belongs_to :user
-belongs_to :item
-has_one :address

## addressesテーブル
|Column           | Type     |Options                      |
|-----------------|----------|-----------------------------|
|post_code        |string    |null: false                  |
|prefecture_id    |integer   |null: false                  |
|city             |string    |null: false                  |
|block_number     |string    |null: false                  |
|building_name    |string    |                             |
|telephone_number |string    |null: false                  |
|buyer            |references|null: false,foreign_key: true|

-belongs_to :buyer