task :cron => :environment do

  require 'nokogiri'
  require 'open-uri'

  Cruise.all.each do |c|
    fetcher = PriceFetcher.new(c.url)
    begin
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

class PriceFetcher
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
  end

  def extract_price
    price_in_euro = 0
    if @url.match /e-hoi/
      @doc.css('.price.clearfix em').each do |price|
        if price.content.match /ab/
          price_in_euro =  price.content.match /[0-9\.]+/
          price_in_euro = price_in_euro.to_s
          price_in_euro = price_in_euro.gsub ".", ""
        end
      end
    else
      @doc.css('#preistab_div tr.hell:nth-child(2) td:nth-child(2) span').each do |price|
        price_in_euro = price.content
      end
    end
    raise "Price is 0 on url #{@url}" if price_in_euro == 0
    price_in_euro.to_i
  end
end