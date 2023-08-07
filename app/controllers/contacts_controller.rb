class ContactsController < ApplicationController
    before_action :set_contact, only: %i[show edit destroy]
    skip_before_action :verify_authenticity_token, only: [:search_address]

    def index
      @contacts = Contact.all
    end

    def show
    end

    def new
      @contact = Contact.new
      @contact.build_address
    end

    def edit
      @contact.build_address
    end

    def create
      @contact = Contact.new(contact_params)
  
      respond_to do |format|
        if @contact.save
          format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
          format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @contact.destroy
        
      respond_to do |format|
        format.html { redirect_to contacts_url }
        format.json { head :no_content }
      end
    end

    def search_address
      result = ::Addresses::QueryAddressService.new(payload: params[:contact][:address_attributes][:cep].gsub("-", "")).call

      render json: result
    end

    private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :cep, address_attributes: [:street, :number, :neighborhood, :city, :uf, :cep, :complement] )
    end
end