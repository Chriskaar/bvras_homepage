class AddColorColumn < ActiveRecord::Migration
  def change
  	add_column :settings, :theme_color, :string
  end
end
