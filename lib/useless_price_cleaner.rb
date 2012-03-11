class UselessPriceCleaner
  def delete_useless_prices(cruise)
    useless_prices = find_useless(cruise.prices)
    useless_prices.each do |p|
      p.delete
    end
  end

  def find_useless(prices)
    useless_prices = []
    if prices.length < 3
      return useless_prices
    end

    i = 1
    loop do
      if prices[i-1].price == prices[i].price && prices[i].price == prices[i+1].price
        useless_prices << prices[i]
      end
      i = i+1
      break if i > prices.length - 2
    end
    useless_prices
  end
end