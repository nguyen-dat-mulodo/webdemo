json.extract! recipe, :id, :name, :user_id, :image, :description, :type, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
