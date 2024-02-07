json.extract! fauna, :id, :name, :description, :created_at, :updated_at
json.url fauna_url(fauna, format: :json)
json.description fauna.description.to_s
