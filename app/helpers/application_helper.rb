module ApplicationHelper

	def header_selected action
		if params[:action] == action
			'hover_title'
		else
			''
		end
	end

	def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

end
