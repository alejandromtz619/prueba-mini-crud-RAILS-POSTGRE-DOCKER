class CambioEmpleados < ActiveRecord::Migration[6.1]
  def change
    change_table :empleados do |t|
      t.references :persona, foreign_key: { to_table: :personas }
      t.references :cargo, foreign_key: { to_table: :cargos }
      t.references :ubicacion, foreign_key: { to_table: :ubicaciones }
      t.references :pais, foreign_key: { to_table: :paises }
      t.references :ciudad, foreign_key: { to_table: :ciudades }

      t.timestamps
    end

end
