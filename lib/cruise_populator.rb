require 'open-uri'
require 'cruise_information_extractor'

class CruisePopulator
    def self.populate(cruise)
        cruise.first_price = 0
        cruise.last_price = 0

        html = open(cruise.url)    
        extractor = CruiseInformationExtractor.new(html)
        cruise.name = extractor.get_cruise_title()
        cruise.ship = extractor.get_ship()
        cruise.cruiseline = extractor.get_cruiseline
        cruise
    end
end