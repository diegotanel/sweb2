class CreatePubEventuales < ActiveRecord::Migration
  def change
    create_table :pub_eventuales do |t|
    	t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :num_cuit, :null => false, unique: true
      t.text :detalle, :null => false
    	t.integer :estado

      t.timestamps
    end
  end
end
