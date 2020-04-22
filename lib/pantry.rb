class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new{0}
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end

  def enough_ingredients_for?(recipe)
    in_stock = []
    recipe.ingredients_required.each do |ingredient, amount|
      in_stock << (@stock[ingredient] >= amount)
    end
    if in_stock.include?(false)
      false
    else
      true
    end 
  end
end
