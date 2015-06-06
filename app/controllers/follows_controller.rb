class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @products = current_user.follows.map{|x| x.product}
  end

  def create
    if current_user.follows.where(product_id: params[:format]).empty?
      @follow = Follow.create(product: Product.find(params[:format]), user: current_user)
      flash[:notice] = "Added!"
    else
      flash[:notice] = "You've added already!"
    end
    redirect_to :back
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    flash[:notice] = 'Deleted!'
    redirect_to follows_path
  end
end
