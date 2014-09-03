class Comment < ActiveRecord::Base

  belongs_to :blog

  validates_presence_of :name
  validates_presence_of :comment

  default_scope -> { order('created_at ASC') }

end