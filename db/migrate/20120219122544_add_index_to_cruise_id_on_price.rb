class AddIndexToCruiseIdOnPrice < ActiveRecord::Migration
  def change
    add_index(:prices, :cruise_id)
  end
end
