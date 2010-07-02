require 'spec_helper'

describe User do
  it "should create a new valid attributes" do
    user = Factory.create(:user)
    user.should be_valid
  end
  
  it "should authenticate with valid attributes" do
    user = Factory.create(:user)
    UserSession.create(user).should be_true
  end
  
  it "should not authenticate without valid attributes" do
    user = Factory.create(:user)
    UserSession.create('gigidag','gadigig').should be_false
  end
  
  
end