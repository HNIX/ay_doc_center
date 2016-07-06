json.array!(@documents) do |document|
  json.extract! document, :id, :user_id, :name, :desc, :is_private, :is_writable, :category_id
  json.url document_url(document, format: :json)
end
