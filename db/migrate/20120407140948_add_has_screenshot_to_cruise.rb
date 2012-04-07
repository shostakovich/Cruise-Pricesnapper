class AddHasScreenshotToCruise < ActiveRecord::Migration
  def change
    add_column :cruises, :has_screenshot, :boolean, :default => false
  end
end
