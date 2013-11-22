class SetDefaultToVisible < ActiveRecord::Migration
  def change
    change_column :products, :visible, :boolean, :default => true
  end
end
