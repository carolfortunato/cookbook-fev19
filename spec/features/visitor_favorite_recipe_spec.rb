require 'rails_helper'

feature 'Visitor favorite a recipe' do
  scenario 'successfully favorite' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    click_on recipe.title
    click_on 'Favoritar'

    recipe.reload
    expect(current_path).to eq(recipe_path(recipe.id))
    expect(page).to have_link('Desfavoritar')
    expect(recipe.favorite).to be true
  end

  scenario 'successfully favorite' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           favorite: true,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    click_on recipe.title
    click_on 'Desfavoritar'

    recipe.reload
    expect(current_path).to eq(recipe_path(recipe.id))
    expect(page).to have_link('Favoritar')
    expect(recipe.favorite).to be false
  end
end