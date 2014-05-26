require 'spec_helper'

describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :age => 1,
        :active => false,
        :email => 'john.doe@gmail.com'
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :age => 1,
        :active => false,
        :email => 'jane.doe@gmail.com'
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "john.doe@gmail.com".to_s, :count => 1
    assert_select "tr>td", :text => "jane.doe@gmail.com".to_s, :count => 1
  end
end
