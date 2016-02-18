class RemoveInfoColumnFromSettings < ActiveRecord::Migration
  def change
  	remove_column :settings, :site_info
  end
end
