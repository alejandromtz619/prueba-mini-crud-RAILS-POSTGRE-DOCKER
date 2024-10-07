class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :razon_social
      t.string :ruc
      t.integer :bomba_id

      t.timestamps
    end
  end
end
