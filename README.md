# users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association

- has_many :items
- has_many :buyers

# items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| category  | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :buyer

# buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
