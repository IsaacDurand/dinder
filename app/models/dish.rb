class Dish < ApplicationRecord
  has_many :items
  validates :name, presence: true
  validates :base_servings, numericality: { only_integer: true, greater_than: 0 }
end
