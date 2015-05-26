class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.created.limit(25)
  end

  def show
    @product = Product.find(params[:id])
  end

  def indexlist
    @product = Product.created.limit(25)
  end

  def sold
    @product = Product.sold.limit(25)
  end
end
