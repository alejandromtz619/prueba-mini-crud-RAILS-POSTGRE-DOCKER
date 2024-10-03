class CreateUbicaciones < ActiveRecord::Migration[6.1]
  def change
    create_table :ubicaciones do |t|
      t.string :direccion
      t.integer :ciudad_id
      t.integer :pais_id

      t.timestamps
    end
  end
end
