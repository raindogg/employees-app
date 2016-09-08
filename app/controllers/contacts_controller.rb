class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
    @contact = Contact.create(first_name: params[:first],
                              last_name: params[:last],
                              email: params[:email],
                              phone_number: params[:phone])
    flash[:success] = "Contact added."
    redirect_to "/contacts/#{@contact.id}"
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    phone_number: params[:phone_number])
    flash[:success] = "Contact updated."
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:danger] = "Contact destroyed."
    redirect_to '/contacts'
  end
end
