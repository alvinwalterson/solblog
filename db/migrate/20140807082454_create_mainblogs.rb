class CreateMainblogs < ActiveRecord::Migration
  def change
    create_table :mainblogs do |t|

      t.timestamps
    end
  end
end
