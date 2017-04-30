class ListsController < ApplicationController
  def index
    @lists = List.where(complete: false)
  end

  def new 
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :date, :complete)
  end
end
