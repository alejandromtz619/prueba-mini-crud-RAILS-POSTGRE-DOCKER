class CreatePersonas < ActiveRecord::Migration[6.1]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.integer :edad
      t.references :cargo, foreign_key: true

      t.timestamps
    end
  end
end
