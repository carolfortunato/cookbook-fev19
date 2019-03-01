require 'rails_helper'

feature "User see his a list of recipes" do
  scenario "Successfully" do 
    user = User.create!(email: 'bruno@gmail.com', password: 'acabate')
    user2 = User.create!(email: 'carol@gmail.com', password:'banana')
    list = List.create!(name: 'Festa Junina', user: user)
    recipe_type = RecipeType.create(name: 'Bolos')
    cuisine = Cuisine.create(name: 'Brasileira')

    recipe = Recipe.create!(title: 'Bolo de cenoura', difficulty: 'Médio', user: user,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create!(title: 'Bolo de Fuba', difficulty: 'Médio', user: user2,
    recipe_type: recipe_type, cuisine: cuisine,
    cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
    cook_method: 'Cozinhe o Fuba, corte em pedaços pequenos, misture com o restante dos ingredientes')
  
    ListRecipe.create!(list: list, recipe: recipe)
    ListRecipe.create!(list: list, recipe: recipe2)

    login_as(user, scope: :user)
    visit root_path
    select 'Festa Junina', from: 'Minhas listas'
    click_on 'Ver Lista'

    expect(page).to have_link('Bolo de cenoura')
    expect(page).to have_link('Bolo de Fuba')
  end
end