class Pantry
  attr_reader :stock,
              :shopping_list

  def initialize
    @stock = Hash.new(0)
    @shopping_list = {}
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end
end
