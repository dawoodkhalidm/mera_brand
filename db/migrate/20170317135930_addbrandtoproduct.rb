class Addbrandtoproduct < ActiveRecord::Migration[5.0]
  def change
  	add_reference :products, :brand_owner, index: true
  end
end
