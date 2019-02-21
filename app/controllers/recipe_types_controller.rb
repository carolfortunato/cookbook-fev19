class RecipeTypesController < ApplicationController
  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(type_params)
    if @recipe_type.save
      redirect_to @recipe_type
    else
      render :new
    end
  end

  def show
    @recipe_type = RecipeType.find(params[:id])
  end

  def type_params
    params.require(:recipe_type).permit(:name)
  end
end