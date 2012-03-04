require File.expand_path('../../cruise_price_sampler', __FILE__)

task :cron => :environment do
  Cruise.all.each do |cruise|
    sampler = CruisePriceSampler.new cruise
    sampler.take_sample
    sleep 1
  end
end