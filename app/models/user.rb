class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  has_one :address

  has_many :cards
  has_many :items_statuses,dependent: :destroy
  has_many :items, through: :items_statuses,dependent: :destroy
  accepts_nested_attributes_for :address

  validates :name, presence: true, length: { maximum: 20 }

  validates :first_name_kanji, presence: true, length: { maximum: 20 }, format: { with: /\A[一-龥]+\z/ }
  validates :family_name_kanji, presence: true, length: { maximum: 20 }, format: { with: /\A[一-龥]+\z/ }
  validates :first_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :family_name_kana, presence: true, length: { maximum: 20 }, format: { with: /\A([ァ-ン]|ー)+\z/ }

  validates :birthday, presence: true
  validates :phone_number, presence: true

end