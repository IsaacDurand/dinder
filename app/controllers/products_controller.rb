class ProductsController < ApplicationController
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
