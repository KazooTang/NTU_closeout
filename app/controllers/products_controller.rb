class ProductsController < ApplicationController
  def index
    @products_n = Product.all.count
    @products = Product.search(params[:search]).updated.page(params[:page]).per(25)
  end

  def show
    @product = Product.find(params[:id])
  end

  def indexlist
    @products = Product.created.page(params[:page]).per(28)
  end

  def sold
    @products = Product.sold.page(params[:page]).per(25)
  end

end
