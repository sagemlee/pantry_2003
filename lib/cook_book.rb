class CookBook
    attr_reader :recipes
  def initialize
    @recipes = []
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

end
