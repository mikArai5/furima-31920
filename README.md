# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :comments 
- has_many :orders


## items テーブル
| Column        | Type            | Options                        |
| ------------- | --------------- | ------------------------------ |
| item_name     | string          | null: false                    |
| explain       | text            | null: false                    |
| category_id   | integer         | default: "", null: false       |
| condition_id  | integer         | default: "", null: false       |
| fee_id        | integer         | default: "", null: false       |
| prefecture_id | integer         | default: "", null: false       |
| day_id        | integer         | default: "", null: false       |
| price         | integer         | null: false                    |
| user          | references      | null: false, foreign_key: true |
### Association
- has_many :comments
- belongs_to :user
- belongs_to :order


## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address


## addresses テーブル
| Column        | Type            | Options                        |
| ------------- | --------------- | ------------------------------ |
| postal_code   | string          | default: "", null: false       |
| prefecture_id | integer         | null: false,                   |
| city          | string          | default: "", null: false       |
| house_number  | string          | default: ""                    |
| building_name | string          | default: "", null: false       |
| order         | references      | null: false, foreign_key: true |
| phone_number  | string          | null: false                    |

### Association
- has_many :comments
- belongs_to :order

## orders テーブル
| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address