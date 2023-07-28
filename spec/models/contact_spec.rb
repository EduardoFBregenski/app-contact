require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with valid attributes" do
    contact = FactoryBot.build(:contact)
    expect(contact).to be_valid, contact.errors.full_messages
  end
  
  context "Validates" do 
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  context "Associations" do 
    it { is_expected.to have_one(:address) }
  end 
end
