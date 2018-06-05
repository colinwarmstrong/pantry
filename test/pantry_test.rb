require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_stock_initializes_as_empty_hash_with_default_value_zero
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
    assert_equal 0, pantry.stock_check('Milk')
  end

  def test_pantry_can_be_restocked
    pantry = Pantry.new
    pantry.restock('Milk', 25)

    assert_equal 25, pantry.stock_check('Milk')

    pantry.restock('Milk', 40)

    assert_equal 65, pantry.stock_check('Milk')
  end



end
