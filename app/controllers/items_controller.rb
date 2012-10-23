class ItemsController < ApplicationController
  before_filter :require_user
  
  def index
    @items = @current_user.open_items
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
    @item = Item.find(params[:id])
    
    if user_can_update_item(@current_user, @item)
      Item.update(@item, :completed => true)
      flash[:notice] = "Item marked as complete."
    else
      flash[:error] = "You do not have access to that item."
    end
    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
  end
  
  def save_sort_order
    # this is awful
    unless params[:sort_order].first.blank?
      item_ids = Array.new
      params[:sort_order].first.split("&").each {|key| item_ids << key.split('=').last }
      logger.error item_ids
      Item.update_all("sort_order = 0", ["user_id = ?", @current_user.id])
      current_sort_counter = 1
      item_ids.each do |item_id|
        item = Item.find(item_id)
        if user_can_update_item(@current_user, item)
          Item.update(item, :sort_order => current_sort_counter)
          current_sort_counter += 1
        end
      end
    end
    flash[:notice] = "Sort order saved."
  end
end
