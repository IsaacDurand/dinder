require 'test_helper'

class DishTest < ActiveSupport::TestCase
  test 'validates presence of name' do
    dish = Dish.new(base_servings: 2)
    assert_not dish.valid?
    dish.name = 'shrimp scampi'
    assert dish.valid?
  end

  test 'validates that base_servings is a positive integer' do
    dish = Dish.new(name: 'shrimp scampi')
    assert_not dish.valid?
    dish.base_servings = -2
    assert_not dish.valid?
    dish.base_servings = 0
    assert_not dish.valid?
    dish.base_servings = 1.5
    assert_not dish.valid?
    dish.base_servings = 1
    assert dish.valid?
  end
end
