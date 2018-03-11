class Recipe < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  #has_many :ingredients, dependent: :destroy
  # 複数の子レコードを管理する
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  #mount_uploader :image, ImageUploader
end
