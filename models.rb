# To play with these classes:
# irb -r ./models.rb

class Product
  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end

class Unit
  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end

class Item
  def initialize(quantity, unit, product)
    @quantity = quantity
    @unit = unit
    @product = product
  end

  def to_s
    "#{@product} (#{@quantity} #{@unit})"
  end
end

lemon = Product.new("lemon")
whole = Unit.new("whole")
item = Item.new(1, whole, lemon)
