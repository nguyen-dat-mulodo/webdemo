require 'rails_helper'

RSpec.describe Post, type: :model do

  it "has a valid factory" do
  	#person = FactoryGirl.build(:person) it is also valid
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:post, title: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without a content" do
    post = FactoryGirl.build(:post, content: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without a quantity" do
    post = FactoryGirl.build(:post, quantity: nil)
    expect(post).not_to be_valid
  end

  it "is invalid if Title is too short (minimum is 5 characters)" do
    post = FactoryGirl.build(:post, title: "Post title 1", content: "Post content 1", quantity: 1)
    expect(post.title.length).not_to be < 5
  end

  it "is invalid if Content is too short (minimum is 10 characters)" do
    post = FactoryGirl.build(:post, title: "Post title 1", content: "Post content 1", quantity: 2)
    expect(post.content.length).not_to be < 10
  end

  it "is invalid if Title has already been taken" do
    post = FactoryGirl.build(:post, title: "Post title 2", content: "Post content 1", quantity: 3)
    expect(post.title).not_to be("Post title 1")
  end

  it "is invalid if Quantity is not integer" do
    post = FactoryGirl.build(:post, title: "Post title 1", content: "Post content 1", quantity: 4)
    expect(post.quantity).to be_an(Integer)
  end
end