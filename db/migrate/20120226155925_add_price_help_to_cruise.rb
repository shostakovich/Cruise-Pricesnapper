class AddPriceHelpToCruise < ActiveRecord::Migration
  def up
    add_column(:cruises, :last_price, :decimal)
    add_column(:cruises, :first_price, :decimal)

    Cruise.all.each do |c|
      puts c.name
      c.first_price = c.prices.order('created_at ASC').first.price
      c.last_price = c.prices.order('created_at ASC').last.price
      c.save
    end
  end

  def down
    remove_column(:cruises, :last_price)
    remove_column(:cruises, :first_price)
  end
end
