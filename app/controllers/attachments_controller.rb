class AttachmentsController < ApplicationController
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    flash[:notice] = 'Deleted!'
    redirect_to :back
  end
end
