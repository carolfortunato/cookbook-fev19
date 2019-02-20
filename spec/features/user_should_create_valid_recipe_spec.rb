require 'rails_helper'

feature 'User should not create a recipe' do
  scenario 'with cook time zero' do
    visit root_path
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    fill_in 'Tipo da Receita', with: 'Entrada'
    fill_in 'Cozinha', with: 'Arabe'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '0'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    click_on 'Enviar'

    #expectativa
    expect(page).to have_content('Você não pode criar uma receita com tempo de preparo igual menor que 1 minuto')
  end

  scenario 'with negative cook time' do
    visit root_path
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    fill_in 'Tipo da Receita', with: 'Entrada'
    fill_in 'Cozinha', with: 'Arabe'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '-16'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    click_on 'Enviar'

      #expectativa
    expect(page).to have_content('Você não pode criar uma receita com tempo de preparo igual menor que 1 minuto')
    
    end

end