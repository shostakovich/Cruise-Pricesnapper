class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :cruise_id
      t.string :cabin_type
      t.decimal :price

      t.timestamps
    end
  end
end
