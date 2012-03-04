require "price_fetcher"

class CruisePriceSampler
  def initialize(cruise)
    @cruise = cruise
  end

  def take_sample
    fetcher = PriceFetcher.new(@cruise.url)

    begin
      price = fetcher.extract_price()
      update_price(price)
    rescue Exception => e
      puts "Sample could not be taken: #{e.message}"
    end
  end

  private

  def update_price(price)
    p = Price.new({:cruise_id => @cruise.id, :price => price})
    p.save!

    @cruise.last_price = price
    @cruise.save!
  end
end