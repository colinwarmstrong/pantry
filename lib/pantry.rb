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

  def what_can_i_make
    valid_recipes.map do |recipe|
      recipe.name
    end
  end

  def how_many_can_i_make
    valid_recipes.inject(Hash.new(0)) do |how_many, recipe|
      how_many[recipe.name] = limiting_ingredient_amount(recipe)
      how_many
    end
  end

  def valid_recipes
    @cookbook.find_all do |recipe|
      recipe.ingredients.all? do |ingredient, amount|
        @stock[ingredient] >= amount
      end
    end
  end

  def limiting_ingredient_amount(recipe)
    amounts_that_can_be_made(recipe).min_by do |ingredient, amount|
      amount
    end
  end

  def amounts_that_can_be_made(recipe)
    recipe.ingredients.map do |ingredient, amount|
      @stock[ingredient] / amount
    end
  end
end
