class ChangeRateToFloatInRatings < ActiveRecord::Migration[5.0]
  def change
  change_column :ratings, :rate, :float
  end

end
