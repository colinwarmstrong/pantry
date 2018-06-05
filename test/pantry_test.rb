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

  def test_shopping_list_initialize_as_an_empty_has
    pantry = Pantry.new

    assert_equal ({}), pantry.shopping_list
  end

  def test_pantry_can_add_to_a_shopping_list
    skip
    recipe = Recipe.new('Cheese Pizza')
    recipe.add_ingredient('Cheese', 20)
    recipe.add_ingredient('Flour', 20)

    pantry = Pantry.new
    pantry.add_to_shopping_list(recipe)

    assert_equal ({'Cheese' => 20, 'Flour' => 20}), pantry.shopping_list
  end



end
