class FollowsController < ApplicationController
  def create
    if current_user.follows.where(product_id: params[:format]).empty?
      @follow = Follow.create(product: Product.find(params[:format]), user: current_user)
      flash[:notice] = "Added!"
    end
    redirect_to :back
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    flash[:notice] = 'Deleted!'
    redirect_to :back
  end
end
