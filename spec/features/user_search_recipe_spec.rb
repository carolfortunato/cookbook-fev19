require 'rails_helper'

feature 'visitor search term' do
  scenario 'successfully with exact term' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    fill_in 'Busca', with: 'Bolo de cenoura'
    click_on 'Buscar'

    expect(page).to have_css('h1', text: 'Resultados da busca')
    expect(page).to have_link('Bolo de cenoura')
  end

  scenario 'no recipe found with term' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    fill_in 'Busca', with: 'Macarronada'
    click_on 'Buscar'

    expect(page).to have_css('h1', text: 'Resultados da busca')
    expect(page).not_to have_link('Bolo de cenoura')
    expect(page).to have_css('p', text: 'Não foram encontradas receitas com esse termo')
  end

  scenario 'suceessfully found more than one recipe with keyword' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe1 = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create(title: 'Bolo de fubá', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, fubá',
                           cook_method: 'Pega o fubá, misture com o restante dos ingredientes')
                           
    visit root_path
    fill_in 'Busca', with: 'Bolo'
    click_on 'Buscar'

    expect(page).to have_css('h1', text: 'Resultados da busca')
    expect(page).to have_link('Bolo de cenoura')
    expect(page).to have_link('Bolo de fubá')

    expect(page).to have_css('p.search-result', count: 2)
  end
end