json.extract! buyer, :id, :sn, :product, :quantity, :contact, :description, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
