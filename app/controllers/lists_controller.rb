class ListsController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    redirect_to @list
  end

  def show
    @list = List.find(params[:id])
  end
end