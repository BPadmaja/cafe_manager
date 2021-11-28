class AddPriceToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :price, :float
  end
end
