task :cron => :environment do

  require 'nokogiri'
  require 'open-uri'

  Cruise.all.each do |c|
    doc = Nokogiri::HTML(open(c.url))
    doc.css(".price.clearfix em").each do |price|
      if price.content.match /ab/
        price_in_euro =  price.content.match /[0-9\.]+/
        price_in_euro = price_in_euro.to_s
        price_in_euro = price_in_euro.gsub ".", ""
        p = Price.new({:cruise_id => c.id, :price => price_in_euro})
        p.save!
      end
    end
  end
end