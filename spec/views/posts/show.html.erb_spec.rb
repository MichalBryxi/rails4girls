require 'spec_helper'

describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :body => "Body",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/1/)
  end
end
