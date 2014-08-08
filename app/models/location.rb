class Location < ActiveRecord::Base

	has_many :photos, dependent: :destroy
	has_many :blogs, dependent: :destroy

	validates_presence_of :name
	validates_uniqueness_of :name

	def sub_blogs
		self.blogs.where(category: false)
	end

	def photo
		photos.where(landing: true).first
	end

	def all_photos
		photos.where(landing: false)
	end

end