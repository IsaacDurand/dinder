class Item < ApplicationRecord
  belongs_to :unit
  belongs_to :product
  belongs_to :dish, optional: true
  validates :quantity, numericality: { greater_than: 0 }
end