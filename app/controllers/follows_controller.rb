class FollowsController < ApplicationController
  def create
    if current_user.follows.where(product_id: params[:format]).empty?
      id = Product.find(params[:format])
      @follow = Follow.create(product: id, user: current_user)
#      flash[:notice] = "Added!"
      render json: {
        message: 'Added!', 
        style: 'success', 
        product_id: params[:format],
        follow_id: @follow.id.to_s + '-delete', 
        path: follow_path(@follow.id)
      }
    else
      render json: {
        message: 'You probably have added ><', 
        style: 'warn'
      }
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    pid = @follow.product_id.to_s
    @follow.destroy
    render json: {
      message: 'Deleted!', 
      style: 'success',
      product_id: pid + '-add',
      follow_id: params[:id],
      path: follows_path(pid)
    }
  end
end
