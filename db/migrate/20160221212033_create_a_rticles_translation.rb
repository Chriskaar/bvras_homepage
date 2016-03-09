class CreateARticlesTranslation < ActiveRecord::Migration
  def self.up
    Article.create_translation_table!({
      :name => :string,
      :content => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Article.drop_translation_table! :migrate_data => true
  end
end
