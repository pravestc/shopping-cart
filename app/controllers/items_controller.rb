class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :set_cart

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

  def add_to_cart
    @item = Item.find(params[:id])
    @cart.items << @item
    flash[:notice] = @item.name + " has been added to cart."

    redirect_to @item
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
  
  def set_cart 
    if Cart.exists?(user_id: session[:current_user_id])
      @cart = Cart.find_by(user_id: session[:current_user_id])
    else
      @cart = Cart.create(user_id: session[:current_user_id])
    end
  end
end
