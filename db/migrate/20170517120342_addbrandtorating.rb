class Addbrandtorating < ActiveRecord::Migration[5.0]
  def change
  	add_reference :ratings, :brand_owner, index: true
  end
end
