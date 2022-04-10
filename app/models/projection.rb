require "faraday"

class Projection < ApplicationRecord
  before_validation :add_attributes

  # validations
  validates :amount, :btc_creation_price, :eth_creation_price, :btc_projection, :eth_projection, presence: true

  validates :amount, numericality: { greater_than: 0 }

  BTC_INTEREST_RATE = 0.05
  ETH_INTEREST_RATE = 0.03

  private

  def add_attributes
    prices = get_prices
    self.btc_creation_price = prices["BTC"]
    self.eth_creation_price = prices["ETH"]

    initial_amount = prices.transform_values{|price| self.amount/price}

    projections = create_projections(initial_amount)

    self.btc_projection = projections["BTC"]
    self.eth_projection = projections["ETH"]
  end

  def get_prices
    response = Faraday.get("https://data.messari.io/api/v2/assets?fields=id,slug,symbol,metrics/market_data/price_usd")
    
    raise StandardError.new "Coins not found" unless response.status == 200
    JSON.parse(response.body)["data"]
      .filter{|coin| ["BTC", "ETH"].include?(coin["symbol"])}
      .map{|coin| {coin["symbol"] => coin.dig("metrics", "market_data", "price_usd")}}
      .reduce(:merge)
  end
  
  def create_projections(initial_amount)
    projections = {}
    projections["BTC"] = (1..12).map{|period| {"Month #{period}" =>initial_amount["BTC"]*(1 + Projection::BTC_INTEREST_RATE)**period}}.reduce({}, :merge).to_json
    projections["ETH"] = (1..12).map{|period| {"Month #{period}" =>initial_amount["ETH"]*(1 + Projection::ETH_INTEREST_RATE)**period}}.reduce({}, :merge).to_json

    projections
  end
end
