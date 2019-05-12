# README
## DB設計
### userテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|name|varchar(64)|null: false|
|email|varchar(256)|null: false, unique: true|
|password|varchar(256)|null: false|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

#### Association
- has_many :messages
- has_many :groups through :members

### groupテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|name|varchar(128)|null: false|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

#### Association
- has_many :messages
- has_many :users through :members

### membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### messageテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|text|varchar(1024)||
|image|varchar(1024)||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

#### Association
- belongs_to :group
- belongs_to :user