
# テーブル設計

## usersテーブル（ユーザー情報テーブル）

| column             | type   | options                                 |
| ------------------ | ------ | --------------------------------------- |
| nick_name          | string | null: false                             |
| email              | string | null: false ,unique: true ,default: ""  |
| encrypted_password | string | null: false ,default: ""                |
| first_name         | string | null: false                             |
| last_name          | string | null: false                             |
| read_first         | string | null: false                             |
| read_last          | string | null: false                             |
| birth_day          | date   | null: false                             |
### association
- has_many : items
- has_many : orders


## itemsテーブル（商品情報テーブル）

| column                   | type       | options                       |
| ------------------------ | ---------- | ----------------------------- |
| user                     | references | null: false, foreign_key: true|
| product_name             | string     | null: false                   |
| product_description      | text       | null: false                   |
| category_id              | integer    | null: false                   |
| condition_id             | integer    | null: false                   |
| contribution_id          | integer    | null: false                   |
| prefecture_id            | integer    | null: false                   |
| day_id                   | integer    | null: false                   |
| price                    | integer    | null: false                   |
### association
- has_one : order
- belongs_to : user


## ordersテーブル（購入記録テーブル）

| column | type       | options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### association
- belongs_to : user
- belongs_to : item
- has_one : address


## addressesテーブル（配送先情報テーブル）

| column         | type       | options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |

| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
### association
- belongs_to : order