class AddModelsForBlog < ActiveRecord::Migration
  def up

  	create_table :blogs do |t|
  		t.references :location

  		t.string :title
  		t.text :body
  		t.string :blog_type

  		t.timestamps
  	end

  	create_table :locations do |t|
  		t.string :name

  		t.timestamps
  	end

  	create_table :photos do |t|
  		t.references :location
			t.references :blog

			t.string :title
      t.string :url

			t.timestamps
  	end

  	add_attachment :blogs, :picture
  	add_attachment :photos, :picture

  end

  def down
  	drop_table :blogs
  	drop_table :locations
  	drop_table :photos

  	remove_attachment :blogs, :picture
  	remove_attachment :photos, :picture
  end
end
