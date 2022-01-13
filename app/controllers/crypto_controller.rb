class CryptoController < ApplicationController
  def assets
    @response = CryptoManager::CryptoCreator.call
    asset = JSON.parse(@response.read_body)
    @length = (asset['content'].length / 100)
    @assets = (params[:page]) ? 
      asset['content'][(params[:page].to_i - 100)..params[:page].to_i] 
        : asset['content'][0..100]
  end
end
