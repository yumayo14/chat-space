# データベース設計計画書

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|なし|
|image|string |なし|
|member_id|integer|foreign_key: true|
|group_id |integer|foreign_key: true|


### Association
- belongs_to :user
- belongs_to :groupe


## usersテーブル
|Column| Type|Options|
|------|-----|-------|
|name    |string |null: false|
|email   |string |null: false|
|paswword|integer|null: false|


###
-テーブル作成後[rails g migration]コマンドを用いて、以下を記述
 add_index :users, :name, unique: true
 add_index :users, :email, unique: true
 add_index :users, :password, unique: true


### Association
- has_many :messages
- has_many :group_members
- has_many :groupes, through: :group_members


## group_membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupesテーブル
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
 -->



<!-- # README

This README would normally document whatever steps are necessary to get the
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
 -->
