module Addresses
    class ApiViaCep
        VIACEP_API = ENV.fetch('VIACEP_API', 'https://viacep.com.br/ws')

        def initialize(options)
            @options = options
        end

        def search_address      
            response = Faraday.get("https://viacep.com.br/ws/#{@options[:payload]}/json", nil, headers)

            {
                status: response.status,
                body: JSON.parse(response.body)
            }
        end

        private

        def headers
            {
                'Content-Type' => 'application/json'
            }
        end
    end
end