class Item < ApplicationRecord

  serialize :images, JSON
  mount_uploaders :images, ImageUploader
  
  has_many :items_statuses
  has_many :users, through: :items_statuses
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :category
end
