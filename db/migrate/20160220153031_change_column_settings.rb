class ChangeColumnSettings < ActiveRecord::Migration
  def up
  	add_column :settings, :place, :string
  end
end
