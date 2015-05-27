class ProductsController < ApplicationController
  def index
    @products_all = Product.all
    @products = Product.created.page(params[:page]).per(25)
  end

  def show
    @product = Product.find(params[:id])
  end

  def indexlist
    @products = Product.created.limit(25)
  end

  def sold
    @products = Product.sold.page(params[:page]).per(25)
  end
end
