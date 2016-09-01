class ContactsController < ApplicationController
  def first
    @contact = Contact.find(1)
  end

  def all
    @contacts = Contact.all
  end

  def add

  end

  def added
    @create = Contact.create(first_name: params[:first], 
                             last_name: params[:last], 
                             email: params[:email], 
                             phone_number: params[:phone])
   
    @message = "You have added " + @create.first_name + " " + @create.last_name + " to the database."
  end
end
