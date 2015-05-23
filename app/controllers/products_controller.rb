class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.created.limit(25)
  end
end
