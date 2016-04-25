class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item has been created."
      redirect_to @item
    else
      flash.now[:alert] = "Item has not been created."
      render "new"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item has been deleted."

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :legend, :effect, :stats)
  end

  def set_item
    @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The item you were looking for could not be found."

    redirect_to items_path
  end


end
