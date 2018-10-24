class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_url
    else
      render :new
    end
  end

private
  def dish_params
    params.require(:dish).permit(:base_servings, :name, :recipe, :recipe_url)
  end
end
