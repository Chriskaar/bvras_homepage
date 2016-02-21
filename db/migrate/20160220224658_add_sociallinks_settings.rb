class AddSociallinksSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :facebook, :string
  	add_column :settings, :twitter, :string
  	add_column :settings, :google, :string
  	add_column :settings, :linkedin, :string
  end
end
