class AddDeliveryToBrandOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :brand_owners, :delevery, :int
  end
end
