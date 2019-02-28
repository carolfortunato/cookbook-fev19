require 'rails_helper'

feature 'User Log in' do
  scenario 'Successfully' do
    User.create!(email: 'carol@gmail.com', password:'banana')

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: 'carol@gmail.com'
    fill_in 'Senha', with: 'banana'
    click_on 'Logar'

    expect(page).to have_css('p', text:'Olá, carol@gmail.com')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link ('Entrar')
    expect(current_path).to eq(root_path)
  end

  scenario 'User log out' do
    User.create!(email: 'carol@gmail.com', password:'banana')

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: 'carol@gmail.com'
    fill_in 'Senha', with: 'banana'
    click_on 'Logar'
    click_on 'Sair'

    expect(page).to have_link ('Entrar')
    expect(page).not_to have_css('p', text:'Olá, carol@gmail.com')
    expect(page).not_to have_link('Sair')
    expect(current_path).to eq(root_path)
  end
end