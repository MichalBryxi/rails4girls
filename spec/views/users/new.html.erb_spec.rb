require 'spec_helper'

describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :age => 1,
      :active => false,
      :email => 'john.doe@gmail.com'
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_age[name=?]", "user[age]"
      assert_select "input#user_active[name=?]", "user[active]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
