class Shopkeeper::ItemsController < Shopkeeper::ApplicationController
  before_action :set_item, only: [:edit, :update]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      pr = @item.price * 100
      @item.update(price: pr)
      flash[:notice] = "Item has been created."
      redirect_to @item
    else
      flash.now[:alert] = "Item has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Item has been updated."
      redirect_to @item
    else
      flash.now[:alert] = "Item has not been updated."
      render "edit"
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
    permitted = Item.globalize_attribute_names + [:price] + [:image]
    params.require(:item).permit(*permitted)
  end

  def set_item
    @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The item you were looking for could not be found."

    redirect_to items_path
  end

end
