class VisitorsController < ApplicationController
	
	before_filter :get_locations

	def home
		@main_blog = Blog.latest_blog
	end

	def solblog
		@main_blogs = Blog.main_blogs.paginate(:page => params[:page], :per_page => 1)
		@selected_blog = @main_blogs.first
		@blog_titles = Blog.main_blogs
		@comment_show = params[:comment_show] || false

		if params[:page].blank? && !params[:blog_id].blank?
			@selected_blog = Blog.where(id: params[:blog_id]).first
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
		redirect_to solblog_path(page: params[:page], comment_show: true) + "#comment-form"
	end

	def solblog_feed
		@feed_blogs = Blog.main_blogs

		render :template => '/feed/feed.rss.builder', :layout => false
	end

	def permit_comment_params
		params.require(:comment).permit(:name, :comment)
	end

end
