json.extract! recipe, :id, :title, :recipe, :photo, :memo, :extlink, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
