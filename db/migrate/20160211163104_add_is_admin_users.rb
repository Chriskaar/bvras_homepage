class AddIsAdminUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_admin, :string
  end
end
