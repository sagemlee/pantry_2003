class Recipe
  attr_reader :name, :ingredients_required, :ingredients
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new{0}
    @ingredients = []

  end

  def add_ingredient(item, amount)
    @ingredients_required[item] += amount
    if @ingredients.include?(item) == false
      @ingredients << item
    end
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end

  end

end
