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

  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        name:     auth.info.name,
        email:    auth.info.email,
        first_name_kanji:   auth.info.first_name,
        family_name_kanji:  auth.info.last_name,
        first_name_kana:    auth.info.first_name,
        family_name_kana:  auth.info.last_name,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
end