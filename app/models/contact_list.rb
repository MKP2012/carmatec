class ContactList < ApplicationRecord
   validates_presence_of :name, on: [:create, :update], message: "can't be blank"
   validates_uniqueness_of :name
   has_many :contact_list_mappings,  dependent: :destroy
   has_many :contacts, through: :contact_list_mappings
end
