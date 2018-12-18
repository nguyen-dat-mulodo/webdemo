require 'rails_helper'

RSpec.describe "branches/edit", type: :view do
  before(:each) do
    @branch = assign(:branch, Branch.create!(
      :name => "MyString",
      :image => "",
      :publish => ""
    ))
  end

  it "renders the edit branch form" do
    render

    assert_select "form[action=?][method=?]", branch_path(@branch), "post" do

      assert_select "input#branch_name[name=?]", "branch[name]"

      assert_select "input#branch_image[name=?]", "branch[image]"

      assert_select "input#branch_publish[name=?]", "branch[publish]"
    end
  end
end
