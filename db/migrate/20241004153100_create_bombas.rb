class CreateBombas < ActiveRecord::Migration[6.1]
  def change
    create_table :bombas do |t|
      t.string :descripcion
      t.string :coordenadas

      t.timestamps
    end
  end
end
