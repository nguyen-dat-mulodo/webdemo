require 'rails_helper'

RSpec.describe "branches/new", type: :view do
  before(:each) do
    assign(:branch, Branch.new(
      :name => "MyString",
      :image => "",
      :publish => ""
    ))
  end

  it "renders new branch form" do
    render

    assert_select "form[action=?][method=?]", branches_path, "post" do

      assert_select "input#branch_name[name=?]", "branch[name]"

      assert_select "input#branch_image[name=?]", "branch[image]"

      assert_select "input#branch_publish[name=?]", "branch[publish]"
    end
  end
end
