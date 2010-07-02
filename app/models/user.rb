class User < ActiveRecord::Base
  include Achievements
  acts_as_authentic
  has_private_messages
  
  #
  # => Authlogic handles the standard validation, so no need for validation here
  #
  


  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :reverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :reverse_friends, :through => :reverse_friendships , :source => :user
  
  has_many :preferences
  has_many :categories, :through => :preferences
  
  has_many :comments
  has_many :books
  
  after_save :add_avatar
  
  has_attached_file :avatar, :styles => { :small => '80x80', :medium => '150x150>'}, 
                             :default_url => '/images/commons/defavatar.png'

  
  named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  
  ROLES = %w[admin author user]
  ACHIEVEMENTS = %w[Critic Famous Publisher]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role?(role)
    roles.include? role.to_s
  end
  
  def friendship(id)
    self.friendships.first(:conditions => {:friend_id => id})
  end
  
  def add_avatar
    if self.avatar.nil?
      self.avatar << Image.find_by_filename("available.jpg")
    end
  end
  
  def current_name_role(object)
    object.name_for(object.current_level(self))
  end
  
  
  def self.notify(user,level)
    message = Message.new
    message.subject = "New Achievement Obtained!"
    message.body = "Congratulations! You have obtained the achievement #{level} and now it displays in your personal page!"
    message.sender = User.first
    message.recipient = user
    message.save
  end
  
  def self.random_users
    self.find(:all,:order => 'random()', :limit => 6)
  end
  

  
end
