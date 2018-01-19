require "rails_helper"

feature "#Post management" do
  scenario "index" do
    visit '/'
    expect(find('ul[@class="menu"]')).to have_link('Post')
    find('ul[@class="menu"]').click_link("Post")
  end

  scenario "create" do
    sign_in
    visit '/posts'

    expect(find('div.container')).to have_link('New Post')
    find('div.container').click_link("New Post")

    within("form#new_post") do
      expect(find('div[@class="form-group"]/label[@for="post_title"]')).to have_text('Title')
      fill_in "Title", :with => "Post title 10"
      expect(find('div[@class="form-group"]/label[@for="post_content"]')).to have_text('Content')
      fill_in "Content", :with => "Post content 10"
      expect(find('div[@class="form-group"]/label[@for="post_quantity"]')).to have_text('Quantity')
      fill_in "Quantity", :with => 10
    end

    expect(find('form#new_post')).to have_button('Create Post')
    find('form#new_post').click_button("Create Post")
    expect(page).to have_text("Post was successfully created.")
  end

end