class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|

    	t.column "first_name", :string, :limit => 50
    	t.column "last_name", :string, :limit => 50
    	t.column "email", :string, :limit => 50
    	t.column "password", :string, :limit => 15

      t.timestamps
    end
  end
end
