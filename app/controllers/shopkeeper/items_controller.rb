class Shopkeeper::ItemsController < Shopkeeper::ApplicationController
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item has been deleted."

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :legend, :effect, :stats, :price)
  end

end
