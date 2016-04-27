class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def index
    @carts = Cart.all
  end

  def place_order
      @cart = Cart.find(params[:id])
    unless user_signed_in?
      flash[:notice] = "Order has not been placed. Please log in first"
      redirect_to @cart
    else

      @cart.user = current_user
      @cart.order = true
      @cart.save
        
      @cart = Cart.create
      session[:cart_id] = @cart.id
    
      flash[:notice] = "Order has been placed. Your cart has been emptied so you can place another order"
      redirect_to @cart 
    end
  end

  private

  def authorize_user!
    unless user_signed_in? 
    end
  end


    
end

