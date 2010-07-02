class FamousObserver < ActiveRecord::Observer
  observe :friendship
  
  def after_save(friendship)
    Famous.award_achievements_for(friendship.friend) if (friendship.friend.reverse_friends.count > 0)
  end
  
  def after_update(friendship)
    Famous.award_achievements_for(friendship.friend) if (friendship.friend.reverse_friends.count > 0)
  end
  
end