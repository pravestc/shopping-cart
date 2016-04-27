class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def index
    unless user_signed_in?
      flash[:notice] = "Can't access placed orders without login in. Please log in first"
      redirect_to items_path 
    else
      @carts = Cart.where(user_id: current_user, order: true)
    end
  end

  def place_order
      @cart = Cart.find(params[:id])
    unless user_signed_in?
      flash[:notice] = "Order has not been placed. Please log in first"
      redirect_to @cart
    else
      @cart.user = current_user
      if @cart.items.empty?
        flash[:notice] = "Order has not been placed. Cart is empty. Please select one or more items before placing your order" 
        redirect_to items_path
      else
        @cart.order = true
        @cart.save
        
        @cart = Cart.create(totalprice: 0)
        session[:cart_id] = @cart.id
        
        flash[:notice] = "Order has been placed. Your cart has been emptied so you can place another order"
        redirect_to carts_path 
      end
    end
  end

  private

  def authorize_user!
    unless user_signed_in? 
    end
  end


    
end

