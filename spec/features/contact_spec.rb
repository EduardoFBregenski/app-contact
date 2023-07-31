require 'rails_helper'

RSpec.feature "Contacts", type: :feature do
  scenario '#index' do
    contact = FactoryBot.create(:contact)
    visit '/'

    expect(page).to have_content("Lista de contatos.")
    expect(page).to have_link("Criar novo contato", href: new_contact_path)
    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.phone)
  end

  scenario '#new' do

   visit new_contact_path
   expect(page).to have_content("Criar novo contato.")
   expect(page).to have_field("Name")
   expect(page).to have_field("Email")
   expect(page).to have_field("Phone")
   expect(page).to have_button("Enviar")
  end 
end
