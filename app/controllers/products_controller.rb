class ProductsController < ApplicationController
  def index
    @products_n = Product.count
    @products = Product.search(params[:search]).created.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def indexlist
    @products = Product.created.selling.page(params[:page]).per(28)
  end

  def sold
    @products = Product.sold.page(params[:page]).updated
  end
end
