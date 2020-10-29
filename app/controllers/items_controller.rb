class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def created
    @item = Item.new(item_params)
    if @item.save
      redrect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :title, :text, :genre_id).merge(user_id: current_user.id)
  end
end
