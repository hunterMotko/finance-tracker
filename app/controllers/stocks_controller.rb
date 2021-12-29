class StocksController < ApplicationController
  before_action :set_client
  
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock].upcase)
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid symbol'
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'users/result' }
      end
    end
  end

  def index
    @most_active = @client.stock_market_list(:mostactive)
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)
    @iex_volume = @client.stock_market_list(:iexvolume)
    @iex_percent = @client.stock_market_list(:iexpercent)
  end

  private

  def set_client
    @client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/stable')
  end
end