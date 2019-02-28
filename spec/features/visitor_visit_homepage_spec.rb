require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'CookBook')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior livro de receitas online')
  end

  scenario 'and view recipe' do
    #cria os dados necessários
    user = User.create!(email: 'carol@gmail.com', password:'banana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                           recipe_type: recipe_type, cuisine: cuisine, user: user,
                           cook_time: 50,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
    expect(page).not_to have_link('Ver todas')
    
  end

  scenario 'and view recipes list' do
    #cria os dados necessários
    user = User.create!(email: 'carol@gmail.com', password:'banana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    another_recipe_type = RecipeType.create(name: 'Prato principal')
    recipe1 = Recipe.create(title: 'Bolinho', difficulty: 'Médio',
                           recipe_type: recipe_type, cuisine: cuisine, user: user,
                           cook_time: 50,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create(title: 'Feijoada', user: user,
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
    recipe3 = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                            recipe_type: recipe_type, cuisine: cuisine,
                            cook_time: 50, user: user,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe4 = Recipe.create(title: 'Feijoada',
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90,user: user,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
    recipe5 = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                            recipe_type: recipe_type, cuisine: cuisine,
                            cook_time: 50,user: user,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe6 = Recipe.create(title: 'Feijoada',user: user,
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
    recipe7 = Recipe.create(title: 'Feijoada',user: user,
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
        
    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('div.recipe', count: 6)
    expect(page).not_to have_css('h1', text: recipe1.title)
    expect(page).to have_link('Ver todas')
  end
end
