class ProductsController < ApplicationController
  def index
    @products_n = Product.all.count
    @products = Product.search(params[:search]).selling.created.page
  end

  def show
    @product = Product.find(params[:id])
  end

  def indexlist
    @products = Product.created.selling.page.per(28)
  end

  def sold
    @products = Product.sold.page.updated
  end
end
