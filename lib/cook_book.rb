require 'date'
class CookBook
    attr_reader :recipes, :date
  def initialize
    @recipes = []
    @date = Date.today.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients_list = []
    @recipes.each do |recipe|
      ingredients_list << recipe.ingredients
    end
    ingredients_list.flatten.uniq.map do |ingredient|
      ingredient.name
    end
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def summary_helper_hash(recipe)
    helper_hash = Hash.new
    helper_inner_hash = Hash.new
    recipe.ingredients_required.each do |ingredient, amount|
      helper_inner_hash[:ingredient] = ingredient.name
      helper_inner_hash[:amount] = amount
    end
    helper_hash[:ingredients] = helper_inner_hash
    helper_hash
  end

  def summary
    @recipes.map do |recipe|
      outer_hash = Hash.new
      outer_hash[:name] = recipe.name
      outer_hash[:details] = summary_helper_hash(recipe)
      outer_hash
    end
  end
end
