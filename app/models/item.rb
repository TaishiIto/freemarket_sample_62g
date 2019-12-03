class Item < ApplicationRecord
  has_many :items_statuses,dependent: :destroy
  has_many :users, through: :items_statuses

  has_many_attached :images

  has_one  :delivery,dependent: :destroy
  accepts_nested_attributes_for :delivery

  validate :images_presence
  validates :name, :description, presence: true
  validates :price,       presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :condition,   numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6}
  validates :size_id,     numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 13}


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :category

  def images_presence
    if images.attached?
      if !images.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:images, 'ファイルを添付してください')
    end
  end
end
