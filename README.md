# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| product_name     | string     | null: false |
| info             | text       | null: false |
| category_id      | integer    | null: false |
| sales_status_id  | integer    | null: false |
| shipping_cost_id | integer    | null: false |
| prefecture_id    | integer    | null: false |
| shipping_id      | integer    | null: false |
| prise            | integer    | null: false |
| user             | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :order

## ShippingAddresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :order

##  ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address
