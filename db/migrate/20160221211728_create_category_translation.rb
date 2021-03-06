class CreateCategoryTranslation < ActiveRecord::Migration
  def self.up
    Category.create_translation_table!({
      :name => :string,
      :description => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Category.drop_translation_table! :migrate_data => true
  end
end
