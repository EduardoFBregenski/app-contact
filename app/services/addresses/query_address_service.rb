class Addresses::QueryAddressService < ApplicationService
    def initialize(options)
      @options = options
    end
  
    def call
      ::Addresses::ApiViaCep.new(@options).search_address
    end
end