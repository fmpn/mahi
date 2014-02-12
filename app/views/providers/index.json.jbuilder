json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :cpf, :bio, :gender, :city, :state, :cep, :age
  json.url provider_url(provider, format: :json)
end
