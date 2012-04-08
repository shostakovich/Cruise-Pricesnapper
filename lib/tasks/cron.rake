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
    screenshot_dir = "./public/images/cruises/"
    big_screenshot = "#{screenshot_dir}#{cruise.id}.png"
    screenshot_preview = "#{screenshot_dir}#{cruise.id}_preview.png"

    system "phantomjs rasterize.js '#{cruise.url}' #{big_screenshot}"
    
    system "convert #{big_screenshot} -crop 1024x768+163+700 #{screenshot_preview}"
    system "convert #{screenshot_preview} -resize 400x300 #{screenshot_preview}"

    cruise.has_screenshot = true
    cruise.save
  end
end
