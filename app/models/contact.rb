class Contact < ApplicationRecord
  belongs_to :user
  def friendly_time
    updated_at.strftime('%A, %B %e, %Y')
  end

  def full_name
    first_name + " " + middle_name + " " + last_name
  end

  def japan_phone
    "+81 " + phone_number
  end
end
