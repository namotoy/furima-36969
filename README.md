## usersテーブル

|Column               | Type        |Options                 |
|---------------------|------------ |------------------------|
|nickname             |string       |null: false             |
|email                |string       |null: false,unique:true |
|encrypted_password   |string       |null: false             |
|name_kanji           |string       |null: false             |
|name_katakana        |string       |null: false             |
|birthday             |string       |null: false             |
 

-has_many :items
-has_many :buyers

## itemsテーブル
|Column          | Type     |Options                      |
|----------------|----------|-----------------------------|
|title           |string    |null: false                  |
|explanation     |text      |null: false                  |
|category        |string    |null: false                  |
|situation       |string    |null: false                  |
|delively charge |string    |null: false                  |
|shipment area   |string    |null: false                  |
|shipping days   |string    |null: false                  |
|price           |string    |null: false                  |
|user            |references|null: false,foreign_key: true|

-belongs_to :users
-has_one :buyers

## buyersテーブル
|Column     | Type     |Options                      |
|-------    |----------|-----------------------------|
|item       |references|null: false,foreign_key: true|
|user       |references|null: false,foreign_key: true|

-belongs_to :users
-belongs_to :items
-belongs_to :addresses

## addressesテーブル
|Column          | Type     |Options                      |
|----------------|----------|-----------------------------|
|post code       |string    |null: false                  |
|prefectures     |string    |null: false                  |
|municipalities  |string    |null: false                  |
|block_number    |string    |null: false                  |
|building_name   |string    |null: false                  |
|telephone_number|string    |null: false                  |

-belongs_to :buyers