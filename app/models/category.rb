class Category < ActiveRecord::Base
	translates :name, :description
	has_many :categorizations
	has_many :articles, :through => :categorizations
	has_many :products, :through => :categorizations
end
