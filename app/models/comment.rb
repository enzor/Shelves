class Comment < ActiveRecord::Base
  acts_as_rateable
  belongs_to :user
  belongs_to :book
  
  validates_presence_of :author, :on => :create, :message => "Please insert your username as author"
  validates_presence_of :body, :on => :create, :message => "Please insert a comment"
  validates_length_of :body, :within => 3..1000, :on => :create, :message => "Comment body must be min 3 characters"
end
