class CreateEmpleados < ActiveRecord::Migration[6.1]
  def change
    create_table :empleados do |t|
      t.integer :persona_id
      t.integer :cargo_id
      t.integer :ubicacion_id
      t.integer :ciudad_id
      t.integer :pais_id

      t.timestamps
    end
  end
end
