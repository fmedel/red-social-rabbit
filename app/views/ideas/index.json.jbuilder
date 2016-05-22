json.array!(@ideas) do |idea|
  json.extract! idea, :id, :titulo, :contenido, :visita, :estado, :user
  json.url idea_url(idea, format: :json)
end
