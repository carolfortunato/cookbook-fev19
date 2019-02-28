require 'rails_helper'

feature 'list all recipes' do
  scenario 'successsfully' do
    #cria os dados necessários
    user = User.create!(email: 'carol@gmail.com', password:'banana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    another_recipe_type = RecipeType.create(name: 'Prato principal')
    recipe1 = Recipe.create(title: 'Bolinho', difficulty: 'Médio',
                           recipe_type: recipe_type, cuisine: cuisine,
                           cook_time: 50, user: user,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    recipe2 = Recipe.create(title: 'Feijoada',
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90, user: user,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
    recipe3 = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                            recipe_type: recipe_type, cuisine: cuisine,
                            cook_time: 50, user: user,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe4 = Recipe.create(title: 'Feijoada', user: user,
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90, user: user,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
    recipe5 = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                            recipe_type: recipe_type, cuisine: cuisine,
                            cook_time: 50, user: user,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe6 = Recipe.create(title: 'Feijoada',
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90, user: user,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
    recipe7 = Recipe.create(title: 'Feijoada', user: user,
                            recipe_type: another_recipe_type,
                            cuisine: cuisine, difficulty: 'Difícil',
                            cook_time: 90, user: user,
                            ingredients: 'Feijão e carnes',
                            cook_method: 'Misture o feijão com as carnes')
        
    # simula a ação do usuário
    visit root_path
    click_on 'Ver todas'

    # expectativas do usuário após a ação
    expect(page).to have_css('div.recipe', count: 7)
    expect(page).to have_link('Voltar para home')
  end
end