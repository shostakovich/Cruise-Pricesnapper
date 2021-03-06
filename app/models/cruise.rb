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

  def last_price=(value)
    write_attribute('last_price', value)
    write_attribute('first_price', value) if self.first_price == 0
  end
end
