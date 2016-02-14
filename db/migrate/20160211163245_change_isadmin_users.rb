class ChangeIsadminUsers < ActiveRecord::Migration
  def change
  	change_column :users, :is_admin, :interger
  end
end
