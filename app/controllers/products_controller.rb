class ProductsController < ApplicationController
  def index
    @products_n = Product.selling.count
    @products = Product.created.selling.page(params[:page])
  end

  def search
    @products = Product.search(params[:search]).updated.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def indexlist
    @products = Product.created.selling.page(params[:page])
  end

  def sold
    @products = Product.sold.page(params[:page]).updated
  end
end
