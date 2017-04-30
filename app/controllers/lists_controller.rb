class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    set_all_lists
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      set_all_lists
      render :index
    end
  end

  def show
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      set_all_lists
      render :index
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_all_lists
    @lists = List.where(complete: false).page(params[:page]).per(5)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :date, :complete)
  end
end
