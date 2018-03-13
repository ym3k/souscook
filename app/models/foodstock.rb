class Foodstock < ApplicationRecord
  default_scope -> { order(beforedate: :asc) }
  belongs_to :user
  belongs_to :unit
end
