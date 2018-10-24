# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]
  validates_length_of :first_name, minimum: 3, maximum: 50, allow_blank: true
  validates_length_of :last_name, minimum: 3, maximum: 50, allow_blank: true
  validates :avatar, content_type: {in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'needs to be an image'}

  enum role: { member: 0, coach: 1}

  has_one_attached :avatar

  def full_name
    [first_name, last_name].join(' ') if first_name && last_name
  end

  def display_name
    self.full_name.blank? ? self.email : self.full_name
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
