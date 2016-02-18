class ChangeColumnName < ActiveRecord::Migration
  def change
  	add_column :settings, :site_description, :string
  end
end
