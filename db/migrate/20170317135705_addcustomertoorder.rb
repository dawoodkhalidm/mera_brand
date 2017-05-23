class Addcustomertoorder < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :customer, index: true
  end
end
