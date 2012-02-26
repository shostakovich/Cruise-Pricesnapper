class AddIndexToCreatedAtOnPrice < ActiveRecord::Migration
  def change
    add_index(:prices, :created_at)
  end
end
