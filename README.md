# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## DB設計

## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|integer|null: false|
|phone_number|integer|unique: true|
|profile|text||
|image|text||
|uid|string||
|provider|string||


### Association
- has_many :items ,through: :items_status dependent: :destroy
- has_many :items_status dependent: :destroy
- has_many :confirmed_addresses dependent: :destroy
- has_many :provider_addresses dependent: :destroy
- has_many :likes dependent: :destroy
- has_many :reviews dependent: :destroy
- has_many :item_comments dependent: :destroy
- has_many :wallets dependent: :destroy
- has_many :points dependent: :destroy 



## itemsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|condition|integer|null: false|
|brand|string||



### Association
- belongs_to :category
- belongs_to :size
- has_many :delivery_ways
- has_many :user ,through: :items_status
- has_many :items_status
- has_many :likes
- has_many :reviews



## items_statusesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|buyer_id|integer||
|item_status|integer|default: 1|
|rate|integer|null: false, default: 3|
|review|text|null: false|



### Association
- belongs_to :user
- belongs_to :item



## confirmed_addressesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|zip_code|integer||
|prefecture|string||
|city|string||
|house_number|string||
|building_name|string||




### Association
- belongs_to :user



## provider_addressesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||



### Association
- belongs_to :user



## delivery_waysテーブル

|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|delivery_cost|integer|null: false|
|shipper_days|integer|null: false|
|delivery_way|integer|null: false|


### Association
- belongs_to :item




## likesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|like|integer|null: false|



### Association
- belongs_to :user
- belongs_to :item



## item_commentsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|null: false|



### Association
- belongs_to :user
- belongs_to :item



## walletsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|wallet|integer|null: false|
|money|integer|null: false|



### Association
- belongs_to :user



## pointsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|score|integer|null: false|



### Association
- belongs_to :user



## categoriesテーブル

|Column|Type|Option|
|------|----|------|
|category|string|null: false|


### Association
- has_many :items




## sizesテーブル

|Column|Type|Option|
|------|----|------|
|size|string|null: false|


### Association
- has_many :items



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
