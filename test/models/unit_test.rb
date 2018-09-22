require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  test 'validates presence of name' do
    unit = Unit.new
    assert_not unit.valid?
    unit.name = 'cup'
    assert unit.valid?
  end

  test 'validates uniqueness of name' do
    Unit.create(name: 'cup')
    unit = Unit.new(name: 'cup')
    assert_not unit.valid?
  end
end
