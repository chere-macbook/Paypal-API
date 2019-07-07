class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :driver_id
      t.integer :rider_id
      t.string :source
      t.string :destination

      t.timestamps
    end
  end
end
