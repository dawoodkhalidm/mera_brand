class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.column "rate", :int

      t.timestamps
    end
  end
end
