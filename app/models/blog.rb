class Blog < ActiveRecord::Base

	BLOG_MAIN = 'Main'
	BLOG_MYSOL = 'MySol'
	BLOG_EAT = 'EatBlog'
	BLOG_PLAY = 'PlayBlog'
	BLOG_STAY = 'StayBlog'

	BLOG_TYPES = ['', BLOG_MAIN, BLOG_MYSOL, BLOG_EAT, BLOG_PLAY, BLOG_STAY]

	has_many :photos, dependent: :destroy
	belongs_to :location

	has_attached_file :picture, 
										:styles => { 
												:medium => "300x300>", 
												:thumb => "100x100>" 
										}, 
										:default_url => "/images/:style_missing.png"

	validates_presence_of :title, :body
	validates :blog_type, inclusion: { in: BLOG_TYPES}
	validates :category, inclusion: { in: [nil, true, false]}
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  default_scope { order('created_at DESC') }

  # category true => location landing page blog
  # category false => location sub page blogs
  scope :eat, -> { where(blog_type: BLOG_EAT, category: false) }
  scope :stay, -> { where(blog_type: BLOG_STAY, category: false) }
  scope :play, -> { where(blog_type: BLOG_PLAY, category: false) }
  scope :destination, -> { where(category: true) }

  def self.main_blogs
  	where(blog_type: BLOG_MAIN)
  end

  def self.my_sol_blogs
  	where(blog_type: BLOG_MYSOL)
  end

end
