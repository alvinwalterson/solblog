class BlogsController < ApplicationController
	before_filter :authenticate_user!

	before_filter :get_type
	before_filter :get_locations

	def index
		if @name.blank?
			if @type == Blog::BLOG_MAIN
				@blogs = Blog.main_blogs
			elsif @type == Blog::BLOG_MYSOL
				@blogs = Blog.my_sol_blogs
			end
		else
			@location = Location.find_by_name @name
			@destination = @location.blogs.destination
		end
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new permit_blog_params
		@blog.blog_type = @type
		@blog.location = Location.find_by_name(@name)
		@blog.category = @category
		if @blog.save!
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "#{@type} Blog is successfully created."
		else
			redirect_to blogs_path(type: @type, name: @name, category: @category), alert: "Failed to create #{@type} Blog."
		end
	end

	def edit
		@blog = Blog.find params[:id]
	end

	def select_top
		@location = Location.find_by_name params[:name]
		@location.sub_blogs.update_all featured: false
		@blogs = Blog.where(id: params[:featured])

		if @blogs.update_all featured: true
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "Selecting top blogs is successfully finished."
		else
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "Failed to select top blogs."
		end
	end

	def update
		@blog = Blog.find params[:id]

		if @blog.update_attributes permit_blog_params
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "#{@type} Blog is successfully updated."
		else
			redirect_to blogs_path(type: @type, name: @name, category: @category), alert: "Failed to update #{@type} Blog."
		end
	end

	def destroy
		@blog = Blog.find params[:id]

		if @blog.destroy
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "#{@type} Blog is successfully destroyed."
		else
			redirect_to blogs_path(type: @type, name: @name, category: @category), alert: "Failed to destroy #{@type} Blog."
		end
	end

	def show
		@blog = Blog.find params[:id]
	end

	def create_photo
		@photo = Photo.new permit_photo_params
		if @photo.save
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "Photo is successfully created."
		else
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "Failed to create photo."
		end
	end

	def destroy_photo
		@photo = Photo.find(params[:id])

		if @photo.destroy
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "Photo is successfully destroyed."
		else
			redirect_to blogs_path(type: @type, name: @name, category: @category), notice: "Failed to destroy photo."
		end
	end

	def locations
		
	end

	private

	def get_type
		@type = params[:type]
		@name = params[:name]
		@category = params[:category]
	end

	def permit_blog_params
		params.require(:blog).permit(:title, :body, :picture)
	end

	def permit_photo_params
		params.require(:photo).permit(:title, :url, :location_id, :picture, :landing)
	end
end
