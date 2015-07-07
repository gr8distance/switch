json.array!(@cards) do |card|
  json.extract! card, :id, :charged
  json.url card_url(card, format: :json)
end
