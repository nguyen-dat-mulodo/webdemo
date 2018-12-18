require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :name => "MyString",
      :user => nil,
      :image => "",
      :description => "MyText",
      :type => ""
    ))
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "input#recipe_user_id[name=?]", "recipe[user_id]"

      assert_select "input#recipe_image[name=?]", "recipe[image]"

      assert_select "textarea#recipe_description[name=?]", "recipe[description]"

      assert_select "input#recipe_type[name=?]", "recipe[type]"
    end
  end
end
