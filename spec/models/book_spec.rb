require 'spec_helper'

describe Book do

  it "should create a new instance given valid attributes" do
    book = Factory.create(:book)
    book.should_be valid
  end
end
