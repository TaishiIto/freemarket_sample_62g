class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  has_one :address
  has_many :items_statuses
  has_many :items, through: :items_statuses
  accepts_nested_attributes_for :address

  validates name:, presence: true, length: { maximum: 20 }
  validates email:, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }

  validates first_name_kanji:, presence: true, length: { maximum: 20 }, format: { with: /\A[一-龥]+\z/ }
  validates family_name_kanji:, presence: true, length: { maximum: 20 }, format: { with: /\A[一-龥]+\z/ }
  validates first_name_kana:, presence: true, length: { maximum: 20 }, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates family_name_kana:, presence: true, length: { maximum: 20 }, format: { with: /\A([ァ-ン]|ー)+\z/ }

  validates birthday:, presence: true
  validates phone_number:, presence: true
  validates password:, presence: true,format: {/\A[a-z\d]{7,100}+\z/i} # 7文字以上100文字以内

end