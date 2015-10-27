class CreateJoinTableFuncionamientoSalasUsers < ActiveRecord::Migration
  def change
    create_join_table :funcionamiento_salas, :users, :id => false do |t|
      t.references :funcionamiento_sala, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
    add_index :funcionamiento_salas_users, [:funcionamiento_sala_id, :user_id], unique: true, name: 'func_sala_users_index'
  end
end