class RemoveQuantityFromOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.remove :quantity
    end
  end
end
