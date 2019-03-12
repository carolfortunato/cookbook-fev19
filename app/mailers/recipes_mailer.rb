class RecipesMailer < ApplicationMailer
  
  def notify_new_recipe(recipe_id)
    @recipe = Recipe.find(recipe_id)
    mail(to: 'admin@cookbook.com.br', subject: "Nova receita cadastrada: #{@recipe.title}")
  end

end