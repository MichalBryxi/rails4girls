require 'spec_helper'

describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :body => "Body",
        :user_id => 1
      ),
      Post.create!(
        :body => "Body",
        :user_id => 1
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
