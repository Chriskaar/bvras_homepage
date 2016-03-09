class DropArticleCategories < ActiveRecord::Migration
  def change
  	drop_table :article_categories
  end
end
