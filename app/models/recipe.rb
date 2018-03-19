class Recipe < ApplicationRecord
  validates :title, presence: true, length: { maximum: 140 }
  validates :memo, length: { maximum: 500 }
  validates :recipe, length: { maximum: 500 }
  default_scope -> { order(updated_at: :desc) }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  #has_many :ingredients, dependent: :destroy
  # 複数の子レコードを管理する
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  #mount_uploader :image, ImageUploader
  mount_uploader :myphoto, DimageUploader
end
