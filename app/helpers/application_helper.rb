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

	def flash_class(level)
		case level.to_sym
			when :notice then "alert alert-info"
			when :success then "alert alert-success"
			when :error then "alert alert-error"
			when :alert then "alert alert-error"
		end
	end


end
