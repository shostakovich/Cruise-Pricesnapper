require File.expand_path('../../price_fetcher', __FILE__)

task :cron => :environment do
  Cruise.all.each do |c|
    begin
      fetcher = PriceFetcher.new(c.url)
      price = fetcher.extract_price()

      p = Price.new(
          {:cruise_id => c.id,
           :price => price})
      p.save!

      c.last_price = price
      c.save!
    rescue Exception => e
      puts e.message
    end
  end
end