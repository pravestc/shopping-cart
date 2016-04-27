class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :set_cart

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.find_by(user_id: session[:current_user_id])
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
    @cart = Cart.find_by(user_id: session[:current_user_id])
    @item = Item.find(params[:id])
    unless @cart.items.exists?(id: @item.id)
      @cart.items << @item
      @cart.manifests.where(item_id: @item.id).first.update(quantity: 1)
      @cart.manifests(true)
    else
      q1 = 1 + @cart.manifests.where(item_id: @item.id).first.quantity
      @cart.manifests.where(item_id: @item.id).first.update(quantity: q1)
      @cart.manifests(true)
    end 
    flash[:notice] = @item.name + " has been added to cart."

    redirect_to @item
  end

  def remove_from_cart 
    @cart = Cart.find_by(user_id: session[:current_user_id])
    @item = Item.find(params[:id])
    unless @cart.items.exists?(id: @item.id)
      flash[:notice] = @item.name + "is not in cart"
    else
      q1 = @cart.manifests.where(item_id: @item.id).first.quantity
      if q1 == 1
        @cart.items.delete(@item)
      else
        q1 = q1 - 1
        @cart.manifests.where(item_id: @item_id).first.update(quantity: q1)
        @cart.manifests(true)
      end
    end
    flash[:notice] = @item.name + " has been removed from cart."

    redirect_to @item
  end

  private

  def item_params
    params.require(:item).permit(:name, :legend, :effect, :stats, :price)
  end

  def set_item
    @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The item you were looking for could not be found."

    redirect_to items_path
  end
  
  def set_cart 
    if Cart.exists?(id: session[:cart_id])
      @cart = Cart.find_by(id: session[:cart_id])
    else
      @cart = Cart.new
      @cart.save
      session[:cart_id] = @cart.id 
    end
  end
end
