class Page < ActiveRecord::Base
	translates :name, :content
	has_permalink :name
end
