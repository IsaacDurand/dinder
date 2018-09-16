class Item < ApplicationRecord
  belongs_to :unit
  belongs_to :product
  belongs_to :dish
end
