class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol, client = ApiCalls::Stock.call)
    begin
      new(ticker: ticker_symbol, 
          name: client.company(ticker_symbol).company_name, 
          last_price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end

  def self.check_db(ticker_sym)
    find_by(ticker: ticker_sym)
  end
  
end
