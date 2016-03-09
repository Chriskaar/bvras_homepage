class DeleteMeta < ActiveRecord::Migration
  def change
  	drop_table :meta
  end
end
