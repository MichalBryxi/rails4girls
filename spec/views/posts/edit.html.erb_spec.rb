require 'spec_helper'

describe "posts/edit", :type => :view do
  before(:each) do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_body[name=?]", "post[body]"
      assert_select "select#post_user_id[name=?]", "post[user_id]"
      assert_select "select#post_user_id option[value=1]", @user.name
    end
  end
end
