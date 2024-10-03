json.extract! ciudade, :id, :ciudad, :pais => { :pais => ciudade.paise.pais }, :created_at, :updated_at
json.url ciudade_url(ciudade, format: :json)
