class CreateMysols < ActiveRecord::Migration
  def change
    create_table :mysols do |t|

      t.timestamps
    end
  end
end
