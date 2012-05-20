require "test/unit"
require File.expand_path('../../../lib/price_fetcher', __FILE__)

class PriceFetcherTest < Test::Unit::TestCase
  def test_removes_dots_from_prices
    fetcher = PriceFetcher.new("")
    assert_equal 123321, fetcher.clean_price("123.321")
  end

  def test_priceFetcher_recognizesExpiredCruise
    fetcher = PriceFetcher.new("http://www.e-hoi.de/kreuzfahrt/transatlantik-Kreuzfahrten/21793_0/adventure-of-the-seas-royal-caribbean-malaga-spanien-san-juan-puerto-rico.html")
    assert_equal 0, fetcher.extract_price()
  end
end