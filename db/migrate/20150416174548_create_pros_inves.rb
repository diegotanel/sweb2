class CreateProsInves < ActiveRecord::Migration
  def change
    create_table :pros_inves do |t|
    	t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :num_cuit, :null => false, unique: true
      t.text :detalle, :null => false
    	t.integer :estado

      t.timestamps
    end
  end
end
