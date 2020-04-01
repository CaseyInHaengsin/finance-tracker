class Stock < ApplicationRecord


  def self.new_lookup(ticket_symbol)
    client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.aex[:publishable_token],
        secret_token: Rails.application.credentials.aex[:secret_token],
        endpoint: 'https://sandbox.iexapis.com/v1'
    )
    new(ticker: ticket_symbol, name: client.company(ticket_symbol).company_name, last_price: client.price(ticket_symbol))

      #client.price(ticket_symbol)

  end
end
