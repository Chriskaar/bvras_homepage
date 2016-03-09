class CreateMeta < ActiveRecord::Migration
  def change
    create_table :meta do |t|
      t.string :controller
      t.string :title
      t.string :description
      t.string :keywords

      t.timestamps
    end
  end
end
