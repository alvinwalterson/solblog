class AddPhotoType < ActiveRecord::Migration
  def change
  	add_column :photos, :landing, :boolean, default: true
  end
end
