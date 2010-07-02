require 'spec_helper'

describe Comment do


  it "should create a new instance given valid attributes" do
    book = Factory.create(:book)
    comment = Factory.create(:comment,:book_id => book.id)
    comment_should be_valid
  end
end
