class CreateFuncionamientoSalasV2 < ActiveRecord::Migration
  def change
    create_table :funcionamiento_salas_v2 do |t|

    	t.string :nombre_sala
      t.date :fecha_inicio_sala
      t.string :domicilio_sala
      t.string :localidad_sala
      t.string :codigo_postal_sala
      t.string :provincia_sala
      t.date :fecha_inicio_periodo_de_subsidio
      t.boolean :solicitud_de_subsidio_por_primera_vez
      t.boolean :recibio_subsidio_en_el_periodo_inmediatamente_anterior
      t.boolean :algun_integrante_participa 
      t.boolean :solicito_apoyo
      t.date :fecha_del_ultimo_periodo_subsidiado_desde
      t.date :fecha_del_ultimo_periodo_subsidiado_hasta
      t.date :fecha_de_inicio_del_periodo_por_el_que_solicita_subsidio
      t.text :descripcion_proyecto
      t.text :descripcion_estrategias
      t.text :detalle_plan_gastos
      t.string :nombre_responsable
      t.string :apellido_responsable
      t.string :num_cuit_responsable, unique: true
      t.string :domicilio_responsable
      t.string :codigo_postal_responsable
      t.string :localidad_responsable
      t.string :provincia_responsable
      t.string :email_responsable
      t.string :telefono_responsable
      t.string :monto_letra
      t.string :monto_numero
    	t.integer :estado

      t.timestamps null: false
    end
  end
end
