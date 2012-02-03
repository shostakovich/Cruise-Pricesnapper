class ConvertPriceToInt < ActiveRecord::Migration
  def change
    change_column :prices, :price, :integer
  end
end
