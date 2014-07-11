class CreateNaps < ActiveRecord::Migration
  def change
    create_table :naps do |t|
      t.string :type
      t.string :description
      t.string :coordinates

      t.timestamps
    end
  end
end
