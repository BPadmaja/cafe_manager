class AddNameToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :name, :string
  end
end
