class ItemsController < ApplicationController
  def index
  
  end

  def new
    @item = Item.new
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
    params.require(:item).permit({images: []}, :name, :description, :category_id, :size_id, :condition, :price)
  end
end