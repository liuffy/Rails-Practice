class ContactsController < ApplicationController

  def favorite
    contact = Contact.find(params[:contact_id])
    contact.favorite = true
    contact.save
    render json: contact
  end

  def index
  # Rewrite the index method to return (a) the Contacts owned by a user
  # plus (b) the Contacts shared with the user. You can access the specified
  # user through params[:user_id] because it is part of the nested route.
    user = User.find(params[:user_id])
    contacts = user.contacts + user.shared_contacts
    render json: contacts
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render(
      json: @contact.errors.full_messages, status: :unprocessable_entity
      # If something has gone wrong, use a non-200 code to indicate this.
      # In this case, we will return a status code of 422.
      )
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params) #update with contact_params to do a mass-assignment update and save.
      render json: contact
    else
      render json: contact.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
