class Contact < ApplicationRecord
    # Association
    has_one :address, dependent: :destroy 
    accepts_nested_attributes_for :address
    
    # Validation
    validates :name, presence: true
    validates :phone, presence: true
end
