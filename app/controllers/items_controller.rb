class ItemsController < ApplicationController
  before_filter :require_user
  
  def index
    @items = Item.where(:user_id => @current_user.id)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Item created"
      redirect_to items_path
    else
      render :action => :new
    end
  end
end
