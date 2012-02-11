class Cruise < ActiveRecord::Base
  has_many :prices

  validates_presence_of :url, :name

  def to_param
    "#{self.id}-#{name.parameterize}"
  end

  def is_cheaper
     first_price > last_price
  end

  def is_more_expensive
    first_price < last_price
  end

  def has_price
    prices.last != nil
  end

  def first_price
    prices.first.price
  end

  def last_price
    prices.last.price
  end
end
