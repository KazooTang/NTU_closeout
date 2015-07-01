class UsersController < ApplicationController
  before_filter :authenticate_user!

  def post
    @products = Product.where(seller_name: current_user.name)
  end

  def follow
    @products = Product.where(id: current_user.follows.map{|x| x.product.id}).page(params[:page])
  end
end
