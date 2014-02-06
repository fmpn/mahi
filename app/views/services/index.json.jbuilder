json.array!(@services) do |service|
  json.extract! service, :id, :type, :periodicity, :description
  json.url service_url(service, format: :json)
end
