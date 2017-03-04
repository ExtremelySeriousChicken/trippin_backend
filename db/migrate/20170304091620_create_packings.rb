class CreatePackings < ActiveRecord::Migration
  def change
    create_table :packings do |t|
      t.string :item_name
      t.belongs_to :trip
      t.timestamps null: false
    end
  end
end
