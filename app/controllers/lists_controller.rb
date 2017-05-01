class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    set_all_lists
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:notice] = "新增成功"
      redirect_to lists_path
    else
      flash[:alert] = "新增失敗"
      set_all_lists
      render :index
    end
  end

  def show
  end

  def update
    if @list.update(list_params)
      flash[:notice] = "更新成功"
      redirect_to lists_path
    else
      flash[:alert] = "更新失敗"
      set_all_lists
      render :index
    end
  end

  def destroy
    @list.destroy
    flash[:notice] = "刪除成功"
    redirect_to lists_path
  end

  private

  def set_all_lists
    @lists = List.unfinished.page(params[:page]).per(5)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :date, :complete)
  end
end
