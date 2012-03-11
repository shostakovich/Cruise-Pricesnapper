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