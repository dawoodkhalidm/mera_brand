class AddRecieveToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :recieve, :boolean, :default => true
  end
end
