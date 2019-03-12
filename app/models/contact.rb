class Contact < ApplicationRecord
    validates_presence_of :email, :name, on: [:create, :update], message: "can't be blank"
    validates_uniqueness_of :email, :name
    has_many :contact_list_mappings,  dependent: :destroy
    has_many :contact_lists, through: :contact_list_mappings
end
