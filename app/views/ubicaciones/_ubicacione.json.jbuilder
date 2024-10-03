json.extract! ubicacione, :id, :direccion, :ciudad_id, :pais => { :pais => ubicacione.paise.pais }, :ciudad => { :ciudad => ubicacione.ciudade.ciudad }:created_at, :updated_at
json.url ubicacione_url(ubicacione, format: :json)
json.extract! ciudade, :id, :ciudad, :pais => { :pais => ciudade.paise.pais }, :created_at, :updated_at