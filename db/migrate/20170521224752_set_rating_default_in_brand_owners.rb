class SetRatingDefaultInBrandOwners < ActiveRecord::Migration[5.0]
  def change
  change_column :brand_owners, :rating, :float, :default => 1
  end
end
