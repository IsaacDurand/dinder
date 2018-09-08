# To play with these classes:
# irb -r ./models.rb

# To run the file:
# ruby <path>

class Product
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Unit
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Item
  attr_reader :quantity, :unit, :product

  def initialize(quantity, unit, product)
    @quantity = quantity
    @unit = unit
    @product = product
  end

  def to_s
    "#{product} (#{quantity} #{unit})"
  end
end

class ShoppingList
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def to_s
    items.join("\n")
  end
end

class Dish
  attr_reader :name, :recipe, :base_servings, :base_shopping_list
  def initialize(name, recipe, servings, shopping_list)
    @name = name
    @recipe = recipe
    @base_servings = servings
    @base_shopping_list = shopping_list
  end

  def to_s
    "#{name} (serves #{base_servings})"
  end

  def shopping_list(servings=base_servings)
    ratio = servings.fdiv(base_servings)
    base_shopping_list.items.map do |item|
      Item.new(item.quantity * ratio, item.unit, item.product)
    end
  end

  def print_shopping_list(servings=base_servings)
    puts "Shopping list for #{name} (#{servings} servings)"
    puts shopping_list(servings)
  end
end


lemon = Product.new("lemon")
whole = Unit.new("whole")
item_1 = Item.new(1, whole, lemon)

iced_tea = Product.new("iced tea")
fluid_ounce = Unit.new("fluid ounce")
item_2 = Item.new(8, fluid_ounce, iced_tea)

shopping_list = ShoppingList.new([item_1, item_2])
lemony_iced_tea = Dish.new("lemony iced tea", "TBD", 1, shopping_list)

lemony_iced_tea.print_shopping_list(2)

# I can now scale the shopping list for one dish
# Next step: combine multiple dishes into one shopping list
# Perhaps all I need is an operation for concatenating shopping lists?
