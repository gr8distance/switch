json.array!(@shops) do |shop|
  json.extract! shop, :id, :types
  json.url shop_url(shop, format: :json)
end
