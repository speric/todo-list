class ItemsController < ApplicationController
  before_filter :require_user
  
  def index
    @items = Item.where(:user_id => @current_user.id, :completed => false)
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
  
  def mark_as_complete
    begin
      @item = Item.find(params[:id])
    rescue => e
      flash[:error] = "Item not found."
      redirect_to items_path
    end
    
    if user_can_update_item
      @item.completed = true
      @item.save
      flash[:notice] = "Item marked as complete."
    else
      flash[:error] = "You do not have access to that item."
    end
    redirect_to items_path
  end
end
