json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.description product.description
  json.image_url product.image.url(:medium)
  json.price number_to_currency(product.price)
  # json.extract! product, :id, :title, :description, :image => product.image.url.to_s , :price => number_to_currency(product.price).to_s
end
# helpers (helpers.number_to_currency(:price))