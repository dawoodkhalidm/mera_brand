class Addbrandtoorder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :brand_owner, index: true
  end
end
