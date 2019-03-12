require 'rails_helper'
RSpec.describe RecipesMailer do

  describe '.notify_new_recipe' do
    let(:user) {User.create!(email: 'carol@gmail.com', password:'banana')}
    let(:recipe_type) { RecipeType.create(name: 'Entrada')}
    let(:cuisine) { Cuisine.create(name: 'Brasileira')}
    let(:recipe) do 
      Recipe.create!(title: 'Bolodecenoura', difficulty: 'Médio', user: user,
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    end

    it 'should send mail to admin' do
      mail = RecipesMailer.notify_new_recipe(recipe.id)

      expect(mail.to).to include('admin@cookbook.com.br')
    end

    it 'should have the correct subject' do
      mail = RecipesMailer.notify_new_recipe(recipe.id)

      expect(mail.subject).to eq("Nova receita cadastrada: #{recipe.title}")
    end

    it 'should have recipe in the body' do
      mail = RecipesMailer.notify_new_recipe(recipe.id)

      expect(mail.body).to include("Nova receita cadastrada")
      expect(mail.body).to include(recipe.title)

    end



  end
end  