json.extract! artist, :id, :first_name, :last_name, :eb_uid, :website, :twitter, :created_at, :updated_at
json.url artist_url(artist, format: :json)