class AddBlogCategory < ActiveRecord::Migration
  def change
  	add_column :blogs, :category, :boolean, default: false
  end
end
