class AddRateToBrandOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :brand_owners, :rating, :int
  end
end
