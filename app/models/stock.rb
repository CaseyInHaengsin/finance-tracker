class Stock < ApplicationRecord


  def self.new_lookup(ticket_symbol)
    client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.aex[:publishable_token],
        secret_token: Rails.application.credentials.aex[:secret_token],
        endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticket_symbol)

  end
end
