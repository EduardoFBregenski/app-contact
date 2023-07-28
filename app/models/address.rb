class Address < ApplicationRecord
  # Association
  belongs_to :contact

  # Validation  
  validates :street, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :uf, presence: true
  validates :cep, presence: true
end
