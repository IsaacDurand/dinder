class ProductsController < ApplicationController
  # Conventional order of actions: index, show, new, edit, create, update and destroy
  def index
    @products = Product.a_to_z
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

private
  def product_params
    params.require(:product).permit(:name)
  end
end
