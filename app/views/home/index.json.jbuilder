json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.description product.description
  json.image_url product.image.url(:medium)
  json.price number_to_currency(product.price)
end