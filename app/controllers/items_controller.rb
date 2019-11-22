class ItemsController < ApplicationController

  def index
    @items = Item.includes(:items_statuses).limit(10).order("created_at DESC")
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

  end

  def update

  end

  def destroy

  end


  private

  def item_params
    params.require(:item).permit({images: []}, :name, :description, :category_id, :size_id, :condition, :price, :brand,
                                  delivery_attributes:[:id, :delivery_cost, :delivery_days, :delivery_ways])
  end
end