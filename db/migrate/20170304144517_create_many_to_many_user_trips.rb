class CreateManyToManyUserTrips < ActiveRecord::Migration
  def change
    create_table :many_to_many_user_trips do |t|

      t.timestamps null: false
    end
  end
end
