json.id @product.id
json.title @product.title
json.description @product.description
json.image_url @product.image.url(:large)
json.price number_to_currency(@product.price)
# json.url product_url(@product, format: :json)