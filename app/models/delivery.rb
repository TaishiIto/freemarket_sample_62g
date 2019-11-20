class Delivery < ApplicationRecord
  belongs_to :item
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
