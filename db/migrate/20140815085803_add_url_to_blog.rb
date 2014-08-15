class AddUrlToBlog < ActiveRecord::Migration
  def change
  	add_column :blogs, :link_url, :string, default: 'javascript:void(0)'
  end
end
