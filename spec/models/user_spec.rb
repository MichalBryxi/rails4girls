require 'spec_helper'

describe User, :type => :model do
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:age) }
  it { should respond_to(:active) }
  it { should respond_to(:email) }

  it "should has_many to posts" do
    user = FactoryGirl.create(:user)
    post1 = FactoryGirl.create(:post, user: user)
    post2 = FactoryGirl.create(:post, user: user)
    post3 = FactoryGirl.create(:post, user: user)
    expect(user.posts.size).to be(3)
  end

  context 'when creating new record' do
    it "should check length (3 - 15) on first_name" do
      expect(User.new(first_name: 'Jo', last_name: "Doe", email: 'john.doe@example.com', age: 20)).not_to be_valid
      expect(User.new(first_name: 'Johnnnnnnnnnnnny', last_name: "Doe", email: 'john.doe@example.com', age: 20)).not_to be_valid
    end
    it "should check minimum length (3) on last_name" do
      expect(User.new(last_name: 'Do', first_name: 'John', age: 20, email: 'john.doe@example.com')).not_to be_valid
    end
    it "should check age to be between 13 and 99" do
      expect(User.new(age: 12, first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')).not_to be_valid
      expect(User.new(age: 100, first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')).not_to be_valid
    end
    it "should require unique email" do
      john = User.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", age: 20)
      jane = User.new(first_name: "Jane", last_name: "Doe", email: "john.doe@example.com", age: 20)
      expect(jane).not_to be_valid
    end
  end
end
