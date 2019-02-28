class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @recipes = Recipe.all
  end

  def show_all
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe_type = RecipeType.all
    @cuisine = Cuisine.all
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe    
    else
      @recipe_type = RecipeType.all
      @cuisine = Cuisine.all
      show_error
      render 'new'
    end
  end

  def edit
    @cuisine = Cuisine.all
    @recipe_type = RecipeType.all
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe    
    else
      @cuisine = Cuisine.all
      @recipe_type = RecipeType.all
      show_error
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to root_path
    end
  end

  def search
    @recipes = Recipe.where('title like ?', "%#{params[:q]}%")
  end

  def favorite
    @recipe = Recipe.find(params[:id])
    @recipe.update(favorite: true)
    redirect_to @recipe
  end

  def unfavorite
    @recipe = Recipe.find(params[:id])
    @recipe.update(favorite: false)
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty,
                                   :cook_time, :ingredients, :cook_method, :photo)
  end

  def show_error
    flash[:notice] = 'Não foi possível salvar a receita'
  end
end
