class AddCountryCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :country_code, :string
  end
end
