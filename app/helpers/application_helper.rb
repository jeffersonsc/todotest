module ApplicationHelper
	def is_admin?(user)
		user.admin? == true ? "Sim" : "Não"
	end

	def datetime(date)
		date.strftime("%d/%m/%Y %H:%M")
	end

	def date(date)
		date.strftime("%d/%m/%Y")
	end
end
