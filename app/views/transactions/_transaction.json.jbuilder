json.extract! transaction, :id, :transaction_type_id, :print_id, :price, :shipping_cost, :transaction_date, :description, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)