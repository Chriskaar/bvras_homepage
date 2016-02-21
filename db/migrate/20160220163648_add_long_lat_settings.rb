class AddLongLatSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :longitude, :string
  	add_column :settings, :latitude, :string
  end
end
