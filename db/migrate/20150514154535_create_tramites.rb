class CreateTramites < ActiveRecord::Migration
  def change
    create_table :tramites do |t|
    	t.integer :tramitable_id
    	t.string :tramitable_type
    	t.references :user, :null => false

      t.timestamps null: false
    end
    add_index :tramites, [:tramitable_id, :tramitable_type]
  end
end
