class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    r = Recipe.find(params[:id])
    r.update(recipe_params)
    redirect_to r
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty,
                                   :cook_time, :ingredients, :cook_method)
  end
end
