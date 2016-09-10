json.extract! purchase, :id, :print_id, :price, :shipping_cost, :transaction_date, :description, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)