class Photo < ActiveRecord::Base

  belongs_to :blog
  belongs_to :location

  has_attached_file :picture, 
                    :styles => { 
                        :medium => "600x450>", 
                        :thumb => "200x130>" 
                    },
                    url: ':s3_domain_url',
                    :default_url => "/images/:style_missing.png"

  validates_presence_of :title
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  default_scope -> { order('created_at DESC') }

end