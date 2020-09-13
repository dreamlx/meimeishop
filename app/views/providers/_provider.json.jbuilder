json.extract! provider, :id, :title, :logo, :qrcode, :sn, :product_name, :price, :stock, :created_at, :updated_at
json.url provider_url(provider, format: :json)
