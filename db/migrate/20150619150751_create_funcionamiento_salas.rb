class CreateFuncionamientoSalas < ActiveRecord::Migration
  def change
    create_table :funcionamiento_salas do |t|

    	t.string :nombre_sala, :null => false
      t.date :fecha_inicio, :null => false
      t.string :domicilio_sala, :null => false
      t.string :localidad_sala, :null => false
      t.string :codigo_postal_sala, :null => false
      t.string :provincia_sala, :null => false
      t.text :descripcion_proyecto, :null => false
      t.text :descripcion_estrategias, :null => false
      t.text :detalle_plan_gastos, :null => false
      t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :num_cuit, :null => false, unique: true
      t.string :domicilio, :null => false
      t.string :codigo_postal, :null => false
      t.string :localidad, :null => false
      t.string :provincia, :null => false
      t.string :email, :null => false
      t.string :telefono, :null => false
      t.string :monto_letra, :null => false
      t.string :monto_numero, :null => false
    	t.integer :estado

      t.timestamps null: false
    end
  end
end
