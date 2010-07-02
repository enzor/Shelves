class Book < ActiveRecord::Base
  acts_as_rateable
  acts_as_ferret :fields => [:name,:description]
  
  belongs_to :user
  has_many :comments
  
  validates_presence_of :name, :on => :create, :message => "Please enter a title"
  validates_presence_of :description, :on => :create, :message => "Please write a description"
  validates_length_of :description, :within => 25..10000, :on => :create, :message => "Please insert a detailed description (min 25 char)"
  
  has_many :categorizations
  has_many :categories , :through => :categorizations
  
  has_attached_file :cover_photo, :styles => {:small => "100x100>", :medium => "250x250>", :large => "300x400" },
                                  :default_url => "/images/commons/defcover_small.png"
                                  

  
  def self.latests(n,includes)
    self.find(:all, :include => includes,:order => 'created_at DESC', :limit => n)
  end
  
  
  def self.featured
    find(:first,:order => 'random()')
  end
  
  def self.shelves_are_empty?
    return true if find(:first).nil?
  end

  
end
