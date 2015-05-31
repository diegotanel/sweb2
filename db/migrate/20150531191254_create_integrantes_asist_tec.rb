class CreateIntegrantesAsistTec < ActiveRecord::Migration
  def change
    create_table :integrantes_asist_tec do |t|
    	t.string :nombre, :null => false
      t.string :apellido, :null => false
      t.string :dni, :null => false, unique: true
      t.date :fecha_nacimiento, :null => false
      t.string :email, :null => false
      t.string :domicilio, :null => false
      t.string :telefono, :null => false
      t.string :rol, :null => false
      t.references :asist_tec, index: true, :null => false

      t.timestamps
    end
  end
end
