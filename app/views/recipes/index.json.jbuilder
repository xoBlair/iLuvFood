json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :link, :image, :recipe
  json.url recipe_url(recipe, format: :json)
end
