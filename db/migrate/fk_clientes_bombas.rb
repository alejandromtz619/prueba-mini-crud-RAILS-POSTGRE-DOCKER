class relacion_clientes_bombas < ActiveRecord::Migration[6.1]
    def change
      change_table :clientes do |t|
        t.references :bomba_id, foreign_key: { to_table: :bombas }
      end
  
  end