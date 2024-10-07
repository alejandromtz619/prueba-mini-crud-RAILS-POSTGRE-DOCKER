json.extract! cliente, :id, :nombre, :razon_social, :ruc, :bomba_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
