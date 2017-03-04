class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :origin_name
      t.string :origin_address
      t.datetime :start_date
      t.string :destination_name
      t.string :destination_address
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
