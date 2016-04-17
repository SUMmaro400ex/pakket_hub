class Contact < PakketHub::Contact

  has_one :user
  has_many :contact_phone_numbers
  has_many :phone_numbers, through: :contact_phone_numbers
end