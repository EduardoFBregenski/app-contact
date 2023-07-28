class Contact < ApplicationRecord
    # Association
    has_one :address, dependent: :destroy 

    # Validation
    validates :name, presence: true
    validates :phone, presence: true
end
