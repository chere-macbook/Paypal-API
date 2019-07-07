class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :age
      t.string :car_number

      t.timestamps
    end
  end
end
