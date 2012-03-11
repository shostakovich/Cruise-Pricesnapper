require 'nokogiri'
require 'open-uri'

class PriceFetcher
  def initialize(url)
    @url = url
  end

  def extract_price
    doc = Nokogiri::HTML(open(@url))

    price_in_euro = 0

    doc.css('.price.clearfix em').each do |price|
      if price.content.match /ab/
        price_in_euro = clean_price(price.content)
      end
    end

    raise "Price is 0 on url #{@url}" if price_in_euro == 0
    puts @url + " : " + price_in_euro.to_s
    price_in_euro
  end

  def clean_price(price)
    price_in_euro = price.match /[0-9\.]+/
    price_in_euro = price_in_euro.to_s
    price_in_euro = price_in_euro.gsub ".", ""
    price_in_euro.to_i
  end
end