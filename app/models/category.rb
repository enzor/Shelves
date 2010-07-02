class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :book, :through => :categorizations
  
  validates_presence_of :name, :on => :create, :message => "Please insert a name"
  has_many :preferences
  has_many :user, :through => :preferences
end
