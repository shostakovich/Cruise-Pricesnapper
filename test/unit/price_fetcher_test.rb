require "test/unit"
require File.expand_path('../../../lib/price_fetcher', __FILE__)

class PriceFetcherTest < Test::Unit::TestCase
  def test_removes_dots_from_prices
    fetcher = PriceFetcher.new("")
    assert_equal 123321, fetcher.clean_price("123.321")
  end
end