json.extract! contact_list, :id, :name, :created_at, :updated_at
json.url contact_list_url(contact_list, format: :json)
