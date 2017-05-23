class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

    	t.column "order_quantity", :string, :limit => 50
    	t.column "order_message", :string, :limit => 50
      t.timestamps
    end
  end
end
