require "spec_helper"
require 'rails_helper'

describe "manager/categories/_form.html.erb" do
  before(:each) do
    @category = FactoryGirl.create(:category)
  end
  it "displays the category to edit" do
    category = mock_model(Category, :cat_id => @category.cat_id, :cat_name => @category.cat_name, :cat_content => @category.cat_content)
    render :partial => "manager/categories/form.html.erb", :locals => {:category => category}

    rendered.should match("#{@category.cat_id}")
    rendered.should match("#{@category.cat_name}")
    rendered.should match("#{@category.cat_content}")
  end
end