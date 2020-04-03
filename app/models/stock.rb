class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true


  def self.new_lookup(ticket_symbol)
    client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.aex[:publishable_token],
        secret_token: Rails.application.credentials.aex[:secret_token],
        endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticket_symbol, name: client.company(ticket_symbol).company_name, last_price: client.price(ticket_symbol))
    rescue => exception
      return nil
    end

      #client.price(ticket_symbol)

  end
end
