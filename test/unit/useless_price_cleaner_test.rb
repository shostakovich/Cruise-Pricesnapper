require "test/unit"

require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../../lib/useless_price_cleaner', __FILE__)

class UselessPriceCleanerTest < Test::Unit::TestCase
  def setup
    @cleaner = UselessPriceCleaner.new
  end

  def test_does_not_clean_two_prices_with_same_date
    prices = generate_prices [123,123]
    assert_empty @cleaner.find_useless(prices)
  end

  def test_does_clean_middle_prices_in_a_row_of_three
    prices = generate_prices [123,123,123]
    assert_equal [prices[1]], @cleaner.find_useless(prices)
  end

  def testDoesCleanMiddlePricesInARowOfFive
    prices = generate_prices [123,123,123,123,123,211,211]
    assert_equal [prices[1], prices[2], prices[3]], @cleaner.find_useless(prices)
  end

  def generate_prices(prices)
    price_objects = []
    prices.each do |price|
      price_objects << Price.new({:price => price})
    end
    price_objects
  end
end