json.extract! persona, :id, :id, :nombre, :edad, :cargo => { :descripcion => persona.cargo.descripcion }, :created_at, :updated_at
json.url persona_url(persona, format: :json)
