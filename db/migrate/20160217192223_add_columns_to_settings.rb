class AddColumnsToSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :google_profile, :string
  	add_column :settings, :facebook_profile, :string
  end
end
