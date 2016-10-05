class ContactSharesController < ApplicationController

  def favorite
    share = ContactShare.find(params[:contact_share_id])
    share.favorite = true
    share.save
    render json: share
  end

  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
      json: contact_share.errors.full_messages, status: :unprocessable_entity
      # If something has gone wrong, use a non-200 code to indicate this. In this case, we will return a status code of 422.
      )
    end
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    contact_share.destroy
    render json: contact_share
  end


  private

  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
