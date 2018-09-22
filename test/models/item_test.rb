require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    # Would it be better to initialize the model instances here rather than using fixtures?
    @whole = units(:whole)
    @apple = products(:apple)
  end

  test 'validates the presence of a unit' do
    item = Item.new(product: @apple, quantity: 1)
    assert_not item.valid?
    item.unit = @whole
    assert item.valid?
  end

  test 'validates the presence of a product' do
    item = Item.new(unit: @whole, quantity: 1)
    assert_not item.valid?
    item.product = @apple
    assert item.valid?
  end

  test 'validates that quantity is a positive number' do
    item = Item.new(unit: @whole, product: @apple)
    assert_not item.valid?
    item.quantity = -1
    assert_not item.valid?
    item.quantity = 0
    assert_not item.valid?
    item.quantity = 0.5
    assert item.valid?
  end
end
