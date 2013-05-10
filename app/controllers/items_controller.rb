class ItemsController < ApplicationController
  before_filter :require_user
  
  def index
    @items = @current_user.open_items
  end
  
  def new
    @item = @current_user.items.new
  end
  
  def create
    @item = @current_user.items.new(params[:item])
    if @item.save
      flash[:notice] = "Item created"
      redirect_to items_path
    else
      render :action => :new
    end
  end
  
  def mark_as_complete
    @item = @current_user.items.find(params[:id])
    
    if @item.update_attributes({:completed => true})
      flash[:notice] = "Item marked as complete."
    else
      flash[:error] = "There was an error updating that item."
    end

    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
  end
  
  def save_sort_order
    unless params[:sort_order].first.blank?
      params[:sort_order].first.split("&").map { |key| key.split('=').last }.each_with_index do |item_id, index|
        item = @current_user.items.find(item_id)
        item.sort_order = index + 1
        item.save
      end
    flash[:notice] = "Sort order saved."
    end
    
    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
  end
end
