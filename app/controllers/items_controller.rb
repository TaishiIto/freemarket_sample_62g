class ItemsController < ApplicationController

  def index
    @items = Item.includes(:items_statuses).limit(10).order("created_at DESC")
  end

  def show
    @detail = Item.includes(:users,:items_statuses,:delivery).find(params[:id])
  end

  def new
    @item = Item.new
    @item.build_delivery
  end
  
  def create
    @item = Item.new(item_params)
    @item.users << current_user
    if @item.save
      redirect_to root_path
    end
  end

  def edit
    @detail = Item.includes(:users,:items_statuses,:delivery).find(params[:id])
  end

  def update
    @detail = Item.includes(:users,:items_statuses,:delivery).find(params[:id])
    if @detail.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def upload_image
    @image_blob = create_blob(params[:image])
    respond_to do |format|
      format.json { @image_blob.id }
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to (root_path)
    else
      render :show
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size_id, :condition, :price, :brand, images: [], 
                                  delivery_attributes:[:id, :delivery_cost, :delivery_days, :delivery_ways])
  end
end