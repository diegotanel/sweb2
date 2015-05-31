class CreateAsistTecs < ActiveRecord::Migration
  def change
    create_table :asist_tecs do |t|
    	t.string :nombre_grupo, :null => false
      t.date :anio_inicio, :null => false
      t.string :num_registro, :null => false, unique: true
      t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :num_cuit, :null => false, unique: true
      t.string :domicilio, :null => false
      t.string :num_registro, :null => false, unique: true
      t.string :codigo_postal, :null => false
      t.string :localidad, :null => false
      t.string :provincia, :null => false
      t.string :email, :null => false
      t.string :telefono, :null => false
      t.string :monto_letra, :null => false
      t.string :monto_numero, :null => false
    	t.integer :estado

      t.timestamps
    end
  end
end
