json.array!(@slides) do |slide|
  json.extract! slide, :name, :url
  json.url slide_url(slide, format: :json)
end