class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @products = current_user.follows.map{|x| x.product}
  end

  def create
    if current_user.follows.where(product_id: params[:format]).empty?
      @follow = Follow.new
      @follow.product = Product.find(params[:format])
      @follow.user = current_user
      if @follow.save
        flash[:notice] = "Added!"
      end
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
