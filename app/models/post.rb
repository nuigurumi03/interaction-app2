class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :images
  has_many :messages
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :detail, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
end
