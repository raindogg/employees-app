class ContactsController < ApplicationController
  def first
    @contact = Contact.find(1)
  end
end
