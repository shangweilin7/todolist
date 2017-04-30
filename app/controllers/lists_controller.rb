class ListsController < ApplicationController
  def index
    @lists = List.where(complete: false)
  end
end
