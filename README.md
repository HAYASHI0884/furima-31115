# users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| lastname           | string  | null: false |
| firstname          | string  | null: false |
| lastname_kana      | string  | null: false |
| firstname_kana     | string  | null: false |
| birth_year_id      | integer | null: false |
| birth_month_id     | integer | null: false |
| birth_day_id       | integer | null: false |

## Association

- has_many :items
- has_many :buyers

# items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | string     | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :buyer

# buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

# addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address_number | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

## Association

- belongs_to :buyer
