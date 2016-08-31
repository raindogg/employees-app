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
    @first_name = params[:first]
    @last_name = params[:last]
    @email = params[:email]
    @phone = params[:phone]
    @message = "You have added " + @first_name + " " + @last_name + " to the database. This person can be reached at " + @email + " " + @phone + "."
  end
end
