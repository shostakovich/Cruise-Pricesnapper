require "test/unit"

class CruiseInitialPopulatorTest < Test::Unit::TestCase
	def testItTakesACruiseAsArgument
		cruise = Object.new
		populator = CruisePopulator.populate(cruise)
	end
end

class CruisePopulator
	def self.populate(cruise)
    cruise.first_price = 0
    cruise.last_price = 0

    html = open(cruise.url)    
    extractor = CruiseInformationExtractor.new(html)
    cruise.name = extractor.get_cruise_title()
    cruise.ship = extractor.get_ship()
    cruise.cruiseline = extractor.get_cruiseline

    sampler = CruisePriceSampler.new(cruise)
    sampler.take_sample
	end
end