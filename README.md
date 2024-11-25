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

- has_many :list
- has_many :order


## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| Product_Name     | string     | null: false |
| info             | text       | null: false |
| category_id      | string     | null: false |
| sales_status_id  | string     | null: false |
| shipping_cost_id | string     | null: false |
| prefecture_id    | string     | null: false |
| shipping_id      | string     | null: false |
| prise            | integer    | null: false |
| user             | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :order

## buy テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| addresses     | string     | null: false |
| phone_number  | string     | null: false |
| order         | references | ShippingAddresses |


### Association

- belongs_to :user

##  ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
