class ChangeRateToFloatInBrandOwners < ActiveRecord::Migration[5.0]
  def change
  	change_column :brand_owners, :rating, :float
  end
end
