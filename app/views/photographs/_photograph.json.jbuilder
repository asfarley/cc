json.extract! photograph, :id, :Device_id, :file, :created_at, :updated_at
json.url photograph_url(photograph, format: :json)
json.file url_for(photograph.file)
