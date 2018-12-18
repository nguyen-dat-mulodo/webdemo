require 'faker'
I18n.reload!

Product.delete_all
Category.delete_all
User.delete_all

#Create fake data for user
10.times do
  User.create(email: Faker::Internet.email, password: 'password')
end

#Create fake data for category
users=User.all
users.each do |u|
  10.times do
    u.create_category(cat_name: Faker::Lorem.sentence, cat_content: Faker::Lorem.sentence)
  end
end
photos = Dir.glob('app/assets/images/img_1.jpg')
file = Rack::Test::UploadedFile.new(photos.sample, 'image/jpeg')
#Create fake data for product
categories = Category.all
categories.each do |c|
  10.times do
    c.products.create(:title => Faker::Lorem.sentence,
                 :description => Faker::Lorem.sentence,
                 :image => file,
                 :price => Faker::Number.rand)
  end
end

Admin.delete_all
Admin.create(email: 'admin@testmail.com', password: '12345678')