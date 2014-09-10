class VisitorsController < ApplicationController
	
	before_filter :get_locations

	def home
		@main_blog = Blog.latest_blog
	end

	def solblog
		@blog_titles = Blog.main_blogs
		@comment_show = params[:comment_show] || false

		if !params[:blog_id].blank?
			@selected_blog = Blog.find(params[:blog_id])
		else
			@selected_blog = Blog.main_blogs.first
		end
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

	def post_comment
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create permit_comment_params
		redirect_to solblog_path(comment_show: params[:comment_show]) + "#comment-form"
	end

	def permit_comment_params
		params.require(:comment).permit(:name, :comment)
	end

end
