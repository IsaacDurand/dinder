require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'validates presence of name' do
    product = Product.new
    assert_not product.valid?
    product.name = 'milk'
    assert product.valid?
  end

  test 'validates uniqueness of name' do
    Product.create(name: 'milk')
    product = Product.new(name: 'milk')
    assert_not product.valid?
  end
end
