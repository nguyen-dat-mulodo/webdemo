require "rails_helper"

RSpec.describe "Post management", :type => :request do
  it "assigns @posts" do
    post = FactoryGirl.create(:post)
    get "/posts"
    expect(assigns(:posts)).to eq([post])
  end

  it "renders the index template" do
    get "/posts"
    expect(response).to render_template :index
  end

  it "renders the show template" do
    @post = FactoryGirl.create(:post)
    get post_path(@post.id)
    expect(response).to render_template(:show)
  end
end