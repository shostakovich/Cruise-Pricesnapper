class AlterPriceFieldsToIntOnCruise < ActiveRecord::Migration
  def change
    change_column :cruises, :last_price, :integer
    change_column :cruises, :first_price, :integer
  end
end
