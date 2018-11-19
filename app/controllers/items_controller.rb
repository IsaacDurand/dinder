class ItemsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    @item = @dish.items.build(item_params)
    if @item.save
      head :created
    else
      head :bad_request
    end
  end

private
 def item_params
   params.require(:item).permit(:product_id, :quantity, :unit_id)
 end
end
