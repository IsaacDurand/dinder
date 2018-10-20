class Product < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  scope :a_to_z, -> { order(:name) }
end
