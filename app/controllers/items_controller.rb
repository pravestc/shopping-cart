class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_cart

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.find_by(user_id: session[:current_user_id])
  end

  def add_to_cart 
    @cart = Cart.find_by(user_id: session[:current_user_id])
    tprice = @cart.totalprice
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
    tprice = tprice + @item.price
    @cart.update(totalprice: tprice)
    flash[:notice] = @item.name + " has been added to cart."

    redirect_to @item
  end

  def remove_from_cart 
    @cart = Cart.find_by(user_id: session[:current_user_id])
    tprice = @cart.totalprice
    @item = Item.find(params[:id])
    unless @cart.items.exists?(id: @item.id)
      flash[:notice] = @item.name + "is not in cart"
    else
      q1 = @cart.manifests.where(item_id: @item.id).first.quantity
      if q1 == 1
        @cart.items.delete(@item)
      else
        q1 = q1 - 1
        @cart.manifests.where(item_id: @item.id).first.update(quantity: q1)
        @cart.manifests(true)
      end
      tprice = tprice - @item.price
      @cart.update(totalprice: tprice)
    end
    flash[:notice] = @item.name + " has been removed from cart."

    redirect_to @item
  end

  private

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
      @cart.totalprice = 0
      @cart.save
      session[:cart_id] = @cart.id 
    end
  end
end

def item_params
  permitted = Item.globalize_attribute_names + [:price] + [:image]
  params.require(:item).permit(*permitted)
end
