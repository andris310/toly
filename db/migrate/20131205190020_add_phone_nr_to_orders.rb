class AddPhoneNrToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone_nr, :string
  end
end
