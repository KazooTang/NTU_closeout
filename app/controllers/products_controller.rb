class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.limit(25)
  end
end
