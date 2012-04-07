require File.expand_path('../../cruise_price_sampler', __FILE__)
require File.expand_path('../../useless_price_cleaner', __FILE__)

task :cron => :environment do
  Cruise.all.each do |cruise|
    sampler = CruisePriceSampler.new cruise
    sampler.take_sample
    sleep 1
  end
end

task :clean_prices => :environment do
  Cruise.all.each do |cruise|
    cleaner = UselessPriceCleaner.new
    cleaner.delete_useless_prices cruise
  end
end

task :take_screenshot => :environment do
  Cruise.where(:has_screenshot => false).each do |cruise|
    cmd = "phantomjs rasterize.js '#{cruise.url}' ./public/images/cruises/#{cruise.id}.jpg"
    system(cmd)
    cruise.has_screenshot = true
    cruise.save
  end
end
