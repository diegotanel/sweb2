class CreateRegistrosPlanDeGastoDeFuncionamientoDeSala < ActiveRecord::Migration
  def change
    create_table :registros_plan_de_gasto_de_funcionamiento_de_sala do |t|
      t.string :rubro
      t.decimal :monto
      t.references :funcionamiento_sala_v2

      t.timestamps null: false
    end
	add_index :registros_plan_de_gasto_de_funcionamiento_de_sala, :funcionamiento_sala_v2_id, :name => 'index_reg_plan_de_gasto_on_func_sala_v2'
  end
end