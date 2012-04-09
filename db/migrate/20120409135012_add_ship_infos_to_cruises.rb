class AddShipInfosToCruises < ActiveRecord::Migration
  def change
  	add_column :cruises, :ship, :string
  	add_column :cruises, :cruiseline, :string
  end
end
