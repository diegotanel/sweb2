class CreateIntegrantesParticipaProyectoSubsidio < ActiveRecord::Migration
  def change
    create_table :integrantes_participa_proyecto_subsidio do |t|
      t.string :nombre_y_apellido
      t.string :proyecto_en_el_que_participa
      t.string :tipo_subsidio_solicitado
      t.references :funcionamiento_sala_v2

      t.timestamps null: false
    end
    add_index :integrantes_participa_proyecto_subsidio, :funcionamiento_sala_v2_id, :name => 'int_proy_subs_on_func_sala_v2'
  end
end
