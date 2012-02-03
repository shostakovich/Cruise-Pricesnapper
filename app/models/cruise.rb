class Cruise < ActiveRecord::Base
  has_many :prices
  default_scope order("created_at asc")

  validates_presence_of :url, :name

  def to_param
    "#{self.id}-#{name.parameterize}"
  end
end
