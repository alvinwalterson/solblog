class AddLandingImageUrlToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :landing_url, :string
  end
end
