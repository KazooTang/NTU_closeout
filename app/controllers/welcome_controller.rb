class WelcomeController < ApplicationController
  def index
    @products = Product.selling.created
    @products_with_picture = Product.selling.where.not(picture: nil).first(21*8).shuffle
    @ps = @products.created.selling.page(params[:page]).per(5)
  end
end
