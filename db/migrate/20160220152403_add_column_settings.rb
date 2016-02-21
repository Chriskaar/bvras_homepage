class AddColumnSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :adress, :string
  	add_column :settings, :postcode, :string
  	add_column :settings, :postal, :string
  end
end
