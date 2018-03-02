class Foodstock < ApplicationRecord
  default_scope -> { order(updated_at: :desc) }
  belongs_to :user
end
