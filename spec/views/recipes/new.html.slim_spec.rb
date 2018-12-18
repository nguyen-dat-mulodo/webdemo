require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :name => "MyString",
      :user => nil,
      :image => "",
      :description => "MyText",
      :type => ""
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "input#recipe_user_id[name=?]", "recipe[user_id]"

      assert_select "input#recipe_image[name=?]", "recipe[image]"

      assert_select "textarea#recipe_description[name=?]", "recipe[description]"

      assert_select "input#recipe_type[name=?]", "recipe[type]"
    end
  end
end
