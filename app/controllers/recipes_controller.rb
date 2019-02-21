class RecipesController < ApplicationController
  def index
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
    if @recipe.save
      redirect_to @recipe    
    else
      @recipe_type = RecipeType.all
      @cuisine = Cuisine.all
      flash[:notice] = 'Não foi possível salvar a receita'
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
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty,
                                   :cook_time, :ingredients, :cook_method)
  end
end
