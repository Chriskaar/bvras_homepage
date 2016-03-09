class Categorization < ActiveRecord::Base
	belongs_to :product
	belongs_to :article
	belongs_to :category
end
