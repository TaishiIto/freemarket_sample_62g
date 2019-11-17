class Item < ApplicationRecord
  has_many :items_statuses
  has_many :users, throuth: :items_statuses
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :category
end
