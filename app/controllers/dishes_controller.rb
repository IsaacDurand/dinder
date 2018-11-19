class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      flash[:notice] = "New dish (#{@dish.name}) successfully created"
      redirect_to dish_url(@dish)
    else
      render js: "alert('Could not create new dish called #{@dish.name}. #{@dish.errors.full_messages.join('. ')}.')", status: :bad_request
    end
  end

private
  def dish_params
    params.require(:dish).permit(:base_servings, :name, :recipe, :recipe_url)
  end
end
