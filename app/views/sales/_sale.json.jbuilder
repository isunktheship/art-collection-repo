json.extract! sale, :id, :purchase_id, :print_id, :price, :shipping_cost, :transaction_date, :description, :created_at, :updated_at
json.url sale_url(sale, format: :json)