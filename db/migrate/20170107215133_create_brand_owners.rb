class CreateBrandOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :brand_owners do |t|

    	t.column "first_name", :string, :limit => 50
    	t.column "last_name", :string, :limit => 50
    	t.column "email", :string, :limit => 50
    	t.column "password", :string, :limit => 15
    	t.column "brand_name", :string, :limit => 50
    	t.column "shop_address", :string, :limit => 100
    	t.column "message", :string, :limit => 100

      t.timestamps
    end
  end
end
