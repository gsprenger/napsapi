json.array!(@naps) do |nap|
  json.extract! nap, :type, :description, :coordinates
  json.url nap_url(nap, format: :json)
end