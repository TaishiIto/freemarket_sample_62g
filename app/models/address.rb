class Address < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates zip_code:, presence: true
  validates city:, presence: true
  validates house_number:, presence: true
  
  validates prefecture_id:, presence: true
  validates user_id:, presence: true
end
