class AddCityToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :city, :string
    add_column :orders, :zipcode, :string
    add_column :orders, :state, :string
  end
end
