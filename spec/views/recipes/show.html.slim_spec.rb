require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :name => "Name",
      :user => nil,
      :image => "",
      :description => "MyText",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
  end
end
