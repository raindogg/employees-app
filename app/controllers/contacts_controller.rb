class ContactsController < ApplicationController
  def first
    @contact = Contact.find(1)
  end

  def all
    @contacts = Contact.all
  end
end
