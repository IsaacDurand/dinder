# To play with these classes:
# irb -r ./models.rb

# To run the file:
# ruby <path>

# TODO: Add tests

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
  # TODO: Subclass ArgumentError?
  PRODUCT_MISMATCH = "Cannot add two items belonging to different products"
  UNIT_MISMATCH = "Cannot add two items with quantities specified in different units"

  attr_reader :unit, :product, :quantity

  def initialize(quantity, unit, product)
    @quantity = quantity
    @unit = unit
    @product = product
  end

  def to_s
    "#{product} (#{quantity} #{unit})"
  end

  def can_add?(other_item)
    begin
      check_for_mismatch(other_item)
      true
    rescue ArgumentError
      false
    end
  end

  def +(other_item)
    check_for_mismatch(other_item)
    combined_quantity = quantity + other_item.quantity
    self.class.new(combined_quantity, unit, product)
  end

private

  def check_for_mismatch(other_item)
    raise ArgumentError, PRODUCT_MISMATCH unless self.product == other_item.product
    raise ArgumentError, UNIT_MISMATCH unless self.unit == other_item.unit
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

  # TODO: refactor to improve variable names
  def +(other_list)
    # Cloning ensures that changing one list will not change any other lists
    combined_items = items.map(&:clone)
    other_list.items.each do |other_item|
      match = false
      combined_items.each_with_index do |item, i|
        if item.can_add?(other_item)
          combined_items[i] = item + other_item
          match = true
        end
      end
      combined_items << other_item.clone unless match
    end
    # TODO: sort combined_items so that items with the same product but different units will appear next to each other?
    self.class.new(combined_items)
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

# lemony_iced_tea.print_shopping_list(2)

# Tests for adding lists (could be more interesting)
# l0 = ShoppingList.new([item_1, item_2])
# l1 = ShoppingList.new([item_1, item_2])
# l2 = l0 + l1
# [l0, l1, l2].each_with_index do |list, i|
#   puts "l#{i}"
#   puts list
# end

# Tests for adding items
# lemon0 = Item.new(1, whole, lemon)
# lemon1 = Item.new(1, whole, lemon)
# lemon2 = lemon0 + lemon1
# [lemon0, lemon1, lemon2].each_with_index do |lemon, i|
#   puts "lemon#{i}"
#   puts lemon
# end
# tea1 = Item.new(8, fluid_ounce, iced_tea)
# tea2 = Item.new(8, whole, iced_tea)
# puts tea1 + tea2
# puts lemon1 + tea1

# Tests for item helper methods
# lemon0 = Item.new(1, whole, lemon)
# lemon1 = Item.new(1, whole, lemon)
# lemon2 = Item.new(1, fluid_ounce, lemon)
# tea = Item.new(8, fluid_ounce, iced_tea)
# puts lemon0.can_add?(lemon1)
# puts lemon0.can_add?(lemon2)
# puts lemon2.can_add?(tea)
