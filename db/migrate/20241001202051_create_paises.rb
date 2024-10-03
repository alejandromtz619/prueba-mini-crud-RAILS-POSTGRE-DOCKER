class CreatePaises < ActiveRecord::Migration[6.1]
  def change
    create_table :paises do |t|
      t.string :pais

      t.timestamps
    end
  end
end
