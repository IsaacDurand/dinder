class Item < ApplicationRecord
  belongs_to :unit
  belongs_to :product
  belongs_to :dish, optional: true
  validates :quantity, numericality: { greater_than: 0 }

  # Would it be better to use a helper here?
  def to_s
    "#{quantity} #{unit.name} #{product.name}"
  end
end
