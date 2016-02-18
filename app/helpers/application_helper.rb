module ApplicationHelper

	def admin?
		if current_user
			current_user.admin == true
		else
			false
		end
	end

	def site_setting?(attribute)
		@setting = Setting.find(1)
		@setting.try(attribute)
	end



end
