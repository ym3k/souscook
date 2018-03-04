class Recipe < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :ingredients, dependent: :destroy
  #mount_uploader :image, ImageUploader
end
