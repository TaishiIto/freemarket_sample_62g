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

  def buy #クレジット購入
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: :cards, action: "new"
    else
      item = Item.find(params[:id])
      status = item.items_statuses
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      Payjp::Charge.create(
      amount: item.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )# ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if status.update(item_status: 2, buyer_id: current_user.id)
        # 購入完了ページに飛ぶ
      else
        # 購入ページにとどまる（仮
      end
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size_id, :condition, :price, :brand, images: [], 
                                  delivery_attributes:[:id, :delivery_cost, :delivery_days, :delivery_ways])
  end
end