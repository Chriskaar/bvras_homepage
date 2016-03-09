class TranslateMeta < ActiveRecord::Migration
  def self.up
    Meta.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Meta.drop_translation_table! :migrate_data => true
  end
end


