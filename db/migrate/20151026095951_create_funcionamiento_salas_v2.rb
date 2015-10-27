class CreateFuncionamientoSalasV2 < ActiveRecord::Migration
  def change
    create_table :funcionamiento_salas_v2 do |t|

    	t.string :nombre_sala, :null => false
      t.date :fecha_inicio_sala, :null => false
      t.string :domicilio_sala, :null => false
      t.string :localidad_sala, :null => false
      t.string :codigo_postal_sala, :null => false
      t.string :provincia_sala, :null => false
      t.date :fecha_inicio_periodo_de_subsidio, :null => false
      t.boolean :solicitud_de_subsidio_por_primera_vez, :null => false
      t.boolean :recibio_subsidio_en_el_periodo_inmediatamente_anterior
      t.date :fecha_del_ultimo_periodo_subsidiado_desde
      t.date :fecha_del_ultimo_periodo_subsidiado_hasta
      t.text :descripcion_proyecto, :null => false
      t.text :descripcion_estrategias, :null => false
      t.text :detalle_plan_gastos, :null => false
      t.string :nombre_responsable, :null => false
      t.string :apellido_responsable, :null => false
      t.string :num_cuit_responsable, :null => false, unique: true
      t.string :domicilio_responsable, :null => false
      t.string :codigo_postal_responsable, :null => false
      t.string :localidad_responsable, :null => false
      t.string :provincia_responsable, :null => false
      t.string :email_responsable, :null => false
      t.string :telefono_responsable, :null => false
      t.string :monto_letra, :null => false
      t.string :monto_numero, :null => false
    	t.integer :estado

      t.timestamps null: false
    end
  end
end
