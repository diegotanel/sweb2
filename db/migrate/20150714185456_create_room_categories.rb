class CreateRoomCategories < ActiveRecord::Migration
  def change
    create_table :room_categories do |t|
      t.string :name
      t.references :hotel, index: true

      t.timestamps null: false
    end
    add_foreign_key :room_categories, :hotels
  end
end
