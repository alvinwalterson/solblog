class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|

      t.timestamps
    end
  end
end
