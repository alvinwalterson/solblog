module ApplicationHelper

	def header_selected action
		if params[:action] == action
			'hover_title'
		else
			''
		end
	end

end
