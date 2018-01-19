require "rails_helper"

feature "#Post management" do
  scenario "index" do
    visit root_path
    click_link "Post"
  end

  scenario "create" do
    sign_in
    visit new_post_path
    within("#new_post") do
      fill_in "Title", :with => "Post title 10"
      fill_in "Content", :with => "Post content 10"
      fill_in "Quantity", :with => 10
    end
    click_button "Create Post"
    expect(page).to have_text("Post was successfully created.")
  end

end