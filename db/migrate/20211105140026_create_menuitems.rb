class CreateMenuitems < ActiveRecord::Migration[6.1]
  def change
    create_table :menuitems do |t|
      t.string :name
      t.float :price
      t.string :cat

      t.timestamps
    end
  end
end
