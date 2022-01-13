module RapidHelper
  class Crypto 

    def self.look_up(asset_id)
      RapidHelper::Crypto.asset_lookup(asset_id)
    end

    private

    def self.asset_lookup(asset_id)
      p asset_id
      url = URI("https://bravenewcoin.p.rapidapi.com/market-cap?assetId=" + asset_id)
  
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
      request = Net::HTTP::Get.new(url)
      request["authorization"] = "Bearer #{Rails.application.credentials.rapid_api[:token]}"
      request["x-rapidapi-host"] = 'bravenewcoin.p.rapidapi.com'
      request["x-rapidapi-key"] = Rails.application.credentials.rapid_api[:key]
  
      response = http.request(request)
      puts response.read_body
    end
  end
end