# README
## DB設計
### userテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

#### Association
- has_many :messages
- has_many :groups through :members
- has_many :members

### groupテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|name|string|null: false|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

#### Association
- has_many :messages
- has_many :users through :members
- has_many :members

### membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :group


### messageテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, primary_key: true|
|text|string||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|

#### Association
- belongs_to :group
- belongs_to :user