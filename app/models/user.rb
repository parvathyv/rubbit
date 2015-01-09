class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :reviews

  has_many :votes

  mount_uploader :profile_photo, ProfilePhotoUploader
end
