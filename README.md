# データベース設計計画書

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|なし|
|image|string |なし|
|user_id|references|foreign_key: true|
|group_id |references|foreign_key: true|


### Association
- belongs_to :user
- belongs_to :group


## usersテーブル
|Column| Type|Options|
|------|-----|-------|
|name    |string |null: false, add_index :users, :name, unique: true|
|email   |string |null: false, add_index :users, :email, unique: true|
|paswword|integer|null: false, add_index :users, :password, unique: true|


### Association
- has_many :messages
- has_many :group_members
- has_many :groups, through: :group_members


## group_membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル
|Column| Type|Options|
|------|-----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :group_members
- has_many :users, through: :group_members

###
- テーブル生成後、自動で作成される[id], [created_at], [updated_at]は記述していない

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



