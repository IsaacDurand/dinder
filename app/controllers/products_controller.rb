class ProductsController < ApplicationController
  # Conventional order of actions: index, show, new, edit, create, update and destroy
  def index
    @products = Product.a_to_z
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "New product (#{@product.name}) successfully created"
    else
      flash[:warning] = "Could not create new product called #{@product.name}. #{@product.errors.full_messages.join('. ')}."
    end
    redirect_to products_url
  end

private
  def product_params
    params.require(:product).permit(:name)
  end
end
