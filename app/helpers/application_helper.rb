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

  def title(page_title)
	  content_for :title, page_title.to_s
	end

	def description(meta_description)
	  content_for :description, meta_description.to_s
	end	

end
