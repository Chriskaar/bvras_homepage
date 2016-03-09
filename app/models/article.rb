class Article < ActiveRecord::Base
	translates :name, :content 
	belongs_to :user
	has_many :categorizations
	has_many :categories, :through => :categorizations
	has_many :taggings
	has_many :tags, through: :taggings
	has_permalink :name
	acts_as_taggable
	acts_as_taggable_on :tags

end
