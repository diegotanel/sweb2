class CreateInstitucionesQueDieronApoyo < ActiveRecord::Migration
  def change
    create_table :instituciones_que_dieron_apoyo do |t|
      t.string :institucion
      t.string :estado_de_apoyo
      t.references :funcionamiento_sala_v2

      t.timestamps null: false
   	end
    add_index :instituciones_que_dieron_apoyo, :funcionamiento_sala_v2_id, :name => 'instituciones_subs_on_func_sala_v2'
  end
end
