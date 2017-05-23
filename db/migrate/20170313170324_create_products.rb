class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

        t.column "product_name", :string, :limit => 50
    	t.column "product_type", :string, :limit => 50
    	t.column "product_quantity", :string, :limit => 50
        t.column "product_price", :int
      
      t.timestamps
    end
  end
end
