class AddIndexToPrice < ActiveRecord::Migration
  def change
    add_index(:prices, :price)
  end
end
