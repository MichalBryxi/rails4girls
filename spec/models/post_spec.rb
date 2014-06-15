require 'spec_helper'

describe Post, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:post)).to be_valid
  end

  it "has body attribute" do
    expect(subject.attributes).to include("body")
  end
  it "has user_id attribute" do
    expect(subject.attributes).to include("user_id")
  end

  it "should belong to user" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
  end
end
