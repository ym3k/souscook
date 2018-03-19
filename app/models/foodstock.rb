class Foodstock < ApplicationRecord
  validates :article, presence: true, length: { maximum: 140 }
  default_scope -> { order(beforedate: :asc) }
  belongs_to :user
  belongs_to :unit
end
