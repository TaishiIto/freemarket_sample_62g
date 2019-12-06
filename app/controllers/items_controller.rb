class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :buy]
  before_action :set_detail, only: [:show, :edit, :update, :purchase, :comment]

  def index
    @items = Item.includes(:items_statuses).page(params[:page]).per(20).order("created_at DESC")
  end

  def show
    case @detail.condition
      when 1 then
        @condition = "新品、未使用"

      when 2 then
        @condition = "未使用に近い"

      when 3 then
        @condition = "目立った傷や汚れなし"

      when 4 then
        @condition = "やや傷や汚れあり"

      when 5 then
        @condition = "傷や汚れあり"

      when 6 then
        @condition = "全体的に状態が悪い"
      
    end

    case @detail.delivery.delivery_cost
      when 1 then
        @delivery_cost = "送料込み(出品者負担)"

      when 2 then
        @delivery_cost = "着払い(購入者負担)'"
      
    end

    case @detail.delivery.delivery_days
      when 1 then
        @delivery_days = "1〜2日で発送"

      when 2 then
        @delivery_days = "3〜4日で発送"

      when 3 then
        @delivery_days = "4〜7日で発送"

    end
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
    else 
      render :new
    end
  end

  def edit

  end

  def update
    unless params[:delete_ids] == [""]
      deleteImages = params[:delete_ids].first.split(',')
      attachments = ActiveStorage::Attachment.where(record_id: params[:id], blob_id: deleteImages)
      attachments.map(&:purge)
    end
    if @detail.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to (root_path)
    else
      render :show
    end
  end

  def purchase

  end

  def comment
    @comments = Comment.new(comment: comment_params[:comment], item_id: comment_params[:id], user_id: current_user.id)
    if @comments.save
      redirect_to item_path
    else
      redirect_to item_path
    end
  end

  def buy #クレジット購入
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to controller: :cards, action: "new"
    else
      status = @item.items_statuses
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      Payjp::Charge.create(
        amount: @item.price, #支払金額
        customer: card.customer_id, #顧客ID
        currency: 'jpy', #日本円
      )# ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if status.update(item_status: 2, buyer_id: current_user.id)
        redirect_to action: "done"
      else
        # 購入ページにとどまる（仮
      end
    end
  end
  
  def done
  
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size_id, :condition, :price, :brand, images: [],
                                  delivery_attributes:[:id, :delivery_cost, :delivery_days, :delivery_ways])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_detail
    @detail = Item.includes(:users,:items_statuses,:delivery,:comments).find(params[:id])
  end

  def comment_params
    params.permit(:comment, :id)
  end

end