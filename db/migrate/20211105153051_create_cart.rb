class CreateCart < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.bigint :user_id
      t.bigint :menuitem_id
      t.bigint :qty

      t.timestamps
    end
  end
end
