class CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(type_params)
    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:notice] = "Não foi possível cadastrar a cozinha"
      render :new
    end
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def type_params
    params.require(:cuisine).permit(:name)
  end
end