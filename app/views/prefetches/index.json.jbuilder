json.array!(@prefetches) do |prefetch|
  json.extract! prefetch, :id, :types
  json.url prefetch_url(prefetch, format: :json)
end
