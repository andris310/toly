class AddShippedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipped, :boolean, :nil => false, :default => false
  end
end
