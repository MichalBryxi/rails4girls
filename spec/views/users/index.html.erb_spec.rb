require 'spec_helper'

describe "users/index", :type => :view do
  before(:each) do
    @users = [
      FactoryGirl.create(:user, :john),
      FactoryGirl.create(:user, :jane)
    ]

    4.times { FactoryGirl.create(:post, user: @users[0]) }
    5.times { FactoryGirl.create(:post, user: @users[1]) }
  end

  it "has header for post count" do
    render
    assert_select "tr>th", :text => "Příspěvků".to_s, :count => 1
  end

  it "has column with post count" do
    render
    assert_select "tr>td", :text => 4.to_s, :count => 1
    assert_select "tr>td", :text => 5.to_s, :count => 1
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "John".to_s, :count => 1
    assert_select "tr>td", :text => "Jane".to_s, :count => 1
    assert_select "tr>td", :text => "Doe".to_s, :count => 2
    assert_select "tr>td", :text => 20.to_s, :count => 1
    assert_select "tr>td", :text => 22.to_s, :count => 1
    assert_select "tr>td", :text => "john.doe@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "jane.doe@example.com".to_s, :count => 1
  end
end
