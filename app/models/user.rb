# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[linkedin crafted_oauth]
  validates_length_of :first_name, minimum: 3, maximum: 50, allow_blank: true
  validates_length_of :last_name, minimum: 3, maximum: 50, allow_blank: true
  validates :avatar, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'],
                                     message: 'needs to be an image' }

  enum role: { member: 0, coach: 1, recruiter: 2 }

  has_one_attached :avatar

  has_many :resources
  has_many :skills

  update_index('users') { self }

  def full_name
    [first_name, last_name].join(' ') if first_name || last_name
  end

  def display_name
    full_name.blank? ? email : full_name
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid if auth.uid
      user.email = auth.info.email if auth.info.email
      user.first_name = auth.info.first_name if auth.info.first_name
      user.last_name = auth.info.last_name if auth.info.last_name
      user.password = Devise.friendly_token[0, 20]
      user.add_avatar_from_url(auth.info.image) if auth.info.image
    end
  end

  def add_avatar_from_url(url)
    file = open(url)
    file_name = file.content_type_parse.first.split('/').last
    avatar.attach(io: file,
                  filename: "temp.#{file_name}",
                  content_type: file.content_type_parse.first)
  end
end
