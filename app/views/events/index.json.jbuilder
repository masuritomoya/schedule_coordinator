json.array!(@events) do |event|
  json.extract! event, :id, :name, :execute_at
  json.url event_url(event, format: :json)
end
