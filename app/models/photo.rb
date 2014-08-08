class Photo < ActiveRecord::Base

	belongs_to :blog
	belongs_to :location

	has_attached_file :picture, 
										:styles => { 
												:medium => "300x300>", 
												:thumb => "100x100>" 
										}, 
										:default_url => "/images/:style_missing.png"

	validates_presence_of :title
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end