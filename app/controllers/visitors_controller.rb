class VisitorsController < ApplicationController
	
	before_filter :get_locations

	def home
		@main_blog = Blog.latest_blog
	end

	def solblog
		@main_blog, @old_blog = Blog.main_blogs.limit 2
	end

	def mysol
		@mysol_blog = Blog.my_sol_blogs.first
	end

	def destination
		@location = Location.includes(:blogs).includes(:photos).find_by_name params[:name]
		@photo = @location.photo.picture.url
		@photos = @location.all_photos.limit 12
		@destination = @location.blogs.destination.first
		@eat_blogs = @location.blogs.eat
		@stay_blogs = @location.blogs.stay
		@play_blogs = @location.blogs.play
		@featured_blogs = @location.sub_blogs.featured
	end

	def travel
	end

	def support
		SupportMailer.notify(params[:support][:email], params[:support][:title], params[:support][:body]).deliver

		redirect_to travel_path, notice: 'Email is successfully sent.'
	end

end
