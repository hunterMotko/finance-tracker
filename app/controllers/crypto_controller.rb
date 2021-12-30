class CryptoController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'
  before_action :asset_list
  
  def assets
    asset = JSON.parse(@response.read_body)
    @length = (asset['content'].length / 100)
    @assets = (params[:page]) ? 
      asset['content'][(params[:page].to_i - 100)..params[:page].to_i] 
        : asset['content'][0..100]
  end
  
  private
  
  def asset_list
    url = URI("https://bravenewcoin.p.rapidapi.com/asset?status=ACTIVE")
  
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'bravenewcoin.p.rapidapi.com'
    request["x-rapidapi-key"] = '51bb43f7e2msh6437498d6862488p15c11fjsn3de5e0c75047'
  
    @response = http.request(request)
  end
end
