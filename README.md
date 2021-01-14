# テーブル設計

## users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| birthday   | date   | null: false |

### Association
- has_many :items
- has_many :comments 


## items テーブル
| Column     | Type            |Options                   |
| ---------- | --------------- | ------------------------ |
| item_name  | string          | null: false              |
| explain    | text            | null: false              |
| category   | string          | default: "", null: false |
| condition  | string          | default: "", null: false |
| fee        | integer         | default: "", null: false |
| consignor  | string          | default: "", null: false |
| days       | date            | default: "", null: false |
| price      | integer         | null: false              |

### Association
- has_many :comments


## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## orders テーブル
| Column     | Type            | Options                        |
| ---------- | --------------- | ------------------------------ |
| number     | string          | null: false                    |
| cvc        | text            | null: false                    |
| exp_month  | string          | null: false                    |
| exp_year   | string          | null: false                    |
| user       | references      | null: false, foreign_key: true |
| item       | references      | null: false, foreign_key: true |

### Association
- belongs_to :item


## addresses テーブル
| Column        | Type            |Options                         |
| ------------- | --------------- | ------------------------------ |
| postal_code   | string          | default: "",null: false        |
| prefecture    | integer         | null: false                    |
| city          | string          | default: ""                    |
| house_number  | string          | default: ""                    |
| building_name | string          | default: ""                    |
| user          | references      | null: false, foreign_key: true |         

### Association
- belongs_to :user

