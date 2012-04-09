require "test/unit"
require File.expand_path('../../../lib/cruise_information_extractor', __FILE__)

class CruiseInformationExtractorTest < Test::Unit::TestCase

	def testItCanExtractTheContentOfASelector
		extractor = CruiseInformationExtractor.new('<div id="test">abc<div>')
		assert_equal "abc", extractor.extract_dom_content("#test")
	end	
	
	def testItCanExtractTheCruiseline
		extractor = CruiseInformationExtractor.new("<p class='reederei'>foobar</p>")
		assert_equal "foobar", extractor.get_cruiseline
	end

	def testItCanExtractTheNameOfTheShip
		extractor = CruiseInformationExtractor.new('<div id="route-schiff"><h4><span>Ms Foobar (Cruiseline)</span></h4><div>')
		assert_equal "Ms Foobar", extractor.get_ship
	end

	def testItCanExtractTheNameOfTheShip
		extractor = CruiseInformationExtractor.new('<div id="route-schiff"><h4><span>Ms Foobar (Cruiseline)</span></h4><div>')
		assert_equal "Ms Foobar", extractor.get_ship
	end
end
