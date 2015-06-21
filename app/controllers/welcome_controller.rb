class WelcomeController < ApplicationController
  def index
    @products = Product.selling.created
    @ps = @products.page(params[:page]).per(5)
  end
end
