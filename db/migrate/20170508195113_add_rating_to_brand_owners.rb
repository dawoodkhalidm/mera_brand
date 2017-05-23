class AddRatingToBrandOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :brand_owners, :rating, :int ,:default => 1
  end
end
