class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.references :blog

  		t.string :name
  		t.text :comment
  		
  		t.timestamps
    end
  end

  def down
  	drop_table :comments
  end
end
