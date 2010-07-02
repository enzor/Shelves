class Ability
  include CanCan::Ability


# =>  
# Admin: Can do all
# Author: Can create ,delete and edit his books. Can comment and rating books. Can have fan
# User: Can create,edit and destroy his comments. Can rate books and become fan of an author
# => 

  def initialize(user)
    user ||= User.new 
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      can :rate, Book
      can :search, Book
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user || user.role?(:admin)
      end
      can :destroy, Comment do |comment|
        comment.try(:user) == user || user.role?(:admin)
      end
      if user.role?(:author)
        can :create, Book
        can :update, Book do |book|
          book.try(:user) == user
        end
        can :destroy, Book do |book|
          book.try(:user) == user
        end
      end
    end
  end
  
end
