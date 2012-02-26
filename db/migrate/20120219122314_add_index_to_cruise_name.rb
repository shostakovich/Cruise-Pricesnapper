class AddIndexToCruiseName < ActiveRecord::Migration
  def change
    add_index(:cruises, :name)
  end
end
