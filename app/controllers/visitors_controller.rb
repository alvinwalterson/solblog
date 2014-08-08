class VisitorsController < ApplicationController
	
	before_filter :get_locations

	def home
		@main_blog = Blog.main_blogs.first
	end

	def solblog
		@main_blog, @old_blog = Blog.main_blogs.limit 2
	end

	def mysol
		@mysol_blog = Blog.my_sol_blogs.first
	end

	def destination
		@location = Location.includes(:blogs).includes(:photos).find_by_name params[:name]
		@photo = @location.photo
		@photos = @location.all_photos
		@destination = @location.blogs.destination.first
		@eat_blogs = @location.blogs.destination.eat
		@stay_blogs = @location.blogs.destination.stay
		@play_blogs = @location.blogs.destination.play
	end

	def travel
		@location = Location.includes(:blogs).includes(:photos).find_by_name params[:name]
		@eat_blogs = @location.blogs.travel.eat
		@stay_blogs = @location.blogs.travel.stay
		@play_blogs = @location.blogs.travel.play
	end

end
