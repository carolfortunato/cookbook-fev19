require 'rails_helper'

feature 'User remove recipe' do
  scenario 'successfully' do
    user = User.create!(email: 'carol@gmail.com', password:'banana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio', user: user,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Remover'

    expect(page).to have_css('p', text: 'Bem-vindo ao maior livro de receitas online')
    expect(page).not_to have_link('Bolo de cenoura')
    expect(Recipe.count).to eq 0
  end

  scenario 'successfully remove one and keep another' do
    user = User.create!(email: 'carol@gmail.com', password:'banana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio', user: user,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    
    Recipe.create(title: 'Bolo de chocolate', difficulty: 'Médio', user: user,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, chocolate',
                  cook_method: 'Pega o chocolate, misture com o restante dos ingredientes')

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Remover'

    expect(page).to have_css('p', text: 'Bem-vindo ao maior livro de receitas online')
    expect(page).not_to have_link('Bolo de cenoura')
    expect(page).to have_link('Bolo de chocolate')
    expect(Recipe.count).to eq 1
  end
end