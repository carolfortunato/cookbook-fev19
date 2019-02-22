require 'rails_helper'

feature 'Admin register cuisine type' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar tipo de cozinha'
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Brasileira')
  end

  scenario 'and must fill in name' do
    visit new_cuisine_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar a cozinha')
  end

  scenario 'can not duplicate a cuisine' do
    #arrange
    Cuisine.create(name: 'Brasileira')

    #act
    visit new_cuisine_path
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Não foi possível cadastrar a cozinha')
  end

end
