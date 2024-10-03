class CreateCargos < ActiveRecord::Migration[6.1]
  def change
    create_table :cargos do |t|
      t.string :descripcion
      t.integer :sueldo

      t.timestamps
    end
  end
end
