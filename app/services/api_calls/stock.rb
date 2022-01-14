module ApiCalls
  class Stock < ApplicationService

    def call
      get_client
    end
    
    private

    def get_client
      @client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
        endpoint: 'https://sandbox.iexapis.com/stable')
    end
  end
end