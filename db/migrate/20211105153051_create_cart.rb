class CreateCart < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :name
      t.float :price
      t.bigint :qty
      t.bigint :user_id

      t.timestamps
    end
  end
end
