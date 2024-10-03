json.extract! empleado, :id, :persona_id, :cargo_id, :ubicacion_id, :ciudad_id, :pais_id, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
