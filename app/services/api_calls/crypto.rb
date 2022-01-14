module ApiCalls
  class Crypto < ApplicationService

    def call
      api_call
    end
    
    private

    def api_call
      url = URI("https://bravenewcoin.p.rapidapi.com/asset?status=ACTIVE")
  
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-host"] = 'bravenewcoin.p.rapidapi.com'
      request["x-rapidapi-key"] = Rails.application.credentials.rapid_api[:key]
    
      @response = http.request(request)
    end
  end
end