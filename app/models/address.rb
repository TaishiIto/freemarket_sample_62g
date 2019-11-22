class Address < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :zip_code, presence: true
  validates :city, presence: true
  validates :house_number, presence: true

  validates :prefecture_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 47}
  validates :user_id, presence: true
end