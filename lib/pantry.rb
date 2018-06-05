class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock = Hash.new(0)
    @shopping_list = {}
    @cookbook = []
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def add_to_shopping_list(recipe)
    @shopping_list.merge!(recipe.ingredients)
  end

  def print_shopping_list
    @shopping_list.each do |ingredient, amount|
      puts "* #{ingredient}: #{amount}"
    end
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
    recipe
  end
end
