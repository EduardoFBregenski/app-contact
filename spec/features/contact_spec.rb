require 'rails_helper'

RSpec.feature "Contacts", type: :feature do
  scenario '#index' do
    contact = FactoryBot.create(:contact)
    visit '/'

    expect(page).to have_content("Lista de contatos.")
    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.phone)
  end
end
