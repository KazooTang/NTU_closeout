class FollowsController < ApplicationController
  def create
    @product = Product.find(params[:product])
    if current_user.follows.where(product_id: params[:product]).empty?
      Follow.create(product: @product, user: current_user)
      @message = 'Added!'
    else
      @message = 'You may have added QQ'
      @style = 'warning'
    end
    render 'create'
  end

  def destroy
    follow = Follow.find(params[:id])
    @product = follow.product
    follow.destroy
    @message = 'Deleted!'
    render 'create'
  end
end
