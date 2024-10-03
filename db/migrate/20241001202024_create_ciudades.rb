class CreateCiudades < ActiveRecord::Migration[6.1]
  def change
    create_table :ciudades do |t|
      t.string :ciudad
      t.references :paise, foreign_key: true

      t.timestamps
    end
  end
end
