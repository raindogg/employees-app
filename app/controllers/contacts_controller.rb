class ContactsController < ApplicationController
  def index
    if current_user
      @contacts = Contact.where(user_id: current_user.id)
    end
    
  end

  def new
  end

  def create
    @contact = Contact.create(first_name: params[:first],
                              last_name: params[:last],
                              middle_name: params[:middle],
                              email: params[:email],
                              phone_number: params[:phone],
                              bio: params[:bio],
                              user_id: current_user.id)
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
                    middle_name: params[:middle_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    phone_number: params[:phone_number],
                    bio: params[:bio])
    flash[:success] = "Contact updated."
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:danger] = "Contact destroyed."
    redirect_to '/contacts'
  end

  def specific
    @contacts = Contact.where(first_name: 'John').find_each do |contact|
      contact.full_name
    end
  end

  def display
    @terms = params[:search_term]
    if @terms
      search_terms = "%#{@terms}%"
      @contacts = Contact.where('first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone_number ILIKE ? OR middle_name ILIKE ? OR bio ILIKE ?', search_terms, search_terms, search_terms, search_terms, search_terms, search_terms)
    end
  end
end
