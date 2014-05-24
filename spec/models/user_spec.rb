require 'spec_helper'

describe User, :type => :model do
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:age) }
  it { should respond_to(:active) }
end
