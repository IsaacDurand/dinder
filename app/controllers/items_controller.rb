class ItemsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    @item = @dish.items.build(item_params)
    if @item.save
      flash[:notice] = "New item (#{@item.to_s}) added to dish"
      redirect_back fallback_location: dish_url(@dish)
    else
      render js: "alert('Could not create new item. #{@item.errors.full_messages.join('. ')}.')", status: :bad_request
    end
  end

private
 def item_params
   params.require(:item).permit(:product_id, :quantity, :unit_id)
 end
end
