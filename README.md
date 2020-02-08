# README

## usersテーブル
| column              | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_one :profile, dependent: :destroy
- has_many :posts
- has_many :messages
- has_many :icons

## profilesテーブル
| column             | Type    | Options           |
| ------------------ | ------- | ----------------- |
| user_id            | integer | foreign_key: true |
| birthyear          | integer | null: false       |
| birthmonth         | integer | null: false       |
| birthday           | integer | null: false       |
| family_name        | string  | null: false       |
| personal_name      | string  | null: false       |
| family_name_kana   | string  | null: false       |
| personal_name_kana | string  | null: false       |
| postal_code        | string  | null: false       |
| prefecture_id      | integer | null: false       |
| city               | string  | null: false       |
| tell               | string  | null: false       |
| house_code         | string  | null: false       |
| bulid_name         | string  | null: false       |

### Association
- belongs_to_active_hash :prefecture
- belongs_to :user

## addressesテーブル
| column        | Type     | Options |
| ------------- | -------- | ------- |
| prefecture_id | integher |         |
| city          | string   |         |

### Association
- belongs_to_active_hash :prefecture

## postsテーブル
| column        | Type   | Options           |
| ------------- | ------ | ----------------- |
| user_id       | intger | foreign_key: true |
| title         | string | null: false       |
| detail        | text   | null: false       |
| prefecture_id | intger | null: false       |
| city          | string | null: false       |
| house_code    | string |                   |
| build_name    | string |                   |

### Association
- belongs_to_active_hash :prefecture
- belongs_to :user
- has_many :images
- has_many :messages

## imagesテーブル
| column  | Type   | Options           |
| ------- | ------ | ----------------- |
| image   | string | null: false       |
| post_id | intger | foreign_key: true |


### Association
- belongs_to :post

## messagesテーブル
| column  | Type   | Options           |
| ------- | ------ | ----------------- |
| user_id | intger | foreign_key: true |
| post_id | intger | foreign_key: true |
| message | text   |                   |

### Association
- belongs_to :post
- belongs_to :user

## iconsテーブル
| columu  | Type   | Options           |
| ------- | ------ | ----------------- |
| user_id | intger | foreign_key: true |
| image   | string |                   |

### Association
- belongs_to :user

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
