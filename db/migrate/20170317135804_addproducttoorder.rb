class Addproducttoorder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :product, index: true
  end
end
