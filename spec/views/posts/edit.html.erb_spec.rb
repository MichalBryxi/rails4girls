require 'spec_helper'

describe "posts/edit", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :body => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_body[name=?]", "post[body]"

      assert_select "input#post_user_id[name=?]", "post[user_id]"
    end
  end
end
