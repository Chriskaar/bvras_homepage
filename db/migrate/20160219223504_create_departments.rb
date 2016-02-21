class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.text :title
      t.text :content
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
