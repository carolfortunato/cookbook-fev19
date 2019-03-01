require 'rails_helper'

feature "User see My Recipes list only with his recipes" do
  scenario "successfully" do
    user = User.create!(email: 'carol@gmail.com', password:'banana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Cuisine.create(name: 'Arabe')
    recipe = Recipe.create!(title: 'Bolo de cenoura', difficulty: 'Médio', user: user,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create!(title: 'Bolo de Fuba', difficulty: 'Médio', user: user,
    recipe_type: recipe_type, cuisine: cuisine,
    cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
    cook_method: 'Cozinhe o Fuba, corte em pedaços pequenos, misture com o restante dos ingredientes')
    
    user2 = User.create!(email: 'bruno@gmail.com', password:'banana')
    recipe3 = Recipe.create!(title: 'Bolo de Laranja', difficulty: 'Médio', user: user2,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a Laranja, corte em pedaços pequenos, misture com o restante dos ingredientes')
    
    login_as(user, scope: :user)
    visit root_path
    click_on "Minhas Receitas"
  
    expect(page).to have_link('Bolo de cenoura')
    expect(page).to have_link('Bolo de Fuba')
    expect(page).not_to have_link('Bolo de Laranja')
  end

  scenario "Unlogged user has no My Recipes link" do
    visit root_path
    expect(page).not_to have_link('Minhas Receitas')
  end

end