class UsersController < ApplicationController
  before_filter :authenticate_user!

  def post
    @products = Product.where(name: current_user.name)
  end

  def follow
    @products = current_user.follows.map{|x| x.product}
  end
end
