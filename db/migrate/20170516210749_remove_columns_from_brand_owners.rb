class RemoveColumnsFromBrandOwners < ActiveRecord::Migration[5.0]
  def change
  	remove_column :brand_owners, :rating
  end
end
