class Dish < ApplicationRecord
  validates :name, presence: true
  validates :base_servings, numericality: { only_integer: true, greater_than: 0 }
end
