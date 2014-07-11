json.array!(@naps) do |nap|
  json.extract! nap, :nap_type, :description, :coordinates
  json.url nap_url(nap, format: :json)
end
