class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :site_name
      t.string :site_info
      t.string :contact_phone
      t.string :contact_mobile
      t.string :contact_adress
      t.string :contact_postal
      t.string :contact_postcode

      t.timestamps
    end
  end
end
