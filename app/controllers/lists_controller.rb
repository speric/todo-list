class ListsController < ApplicationController
  before_filter :require_user
  
  def new
    @list = @current_user.lists.new
  end
  
  def create
    @list = @current_user.lists.new(params[:list])
    if @list.save
      flash[:notice] = "List created"
      redirect_to items_path
    else
      render :action => :new
    end
  end
  
  def show
  end
end
