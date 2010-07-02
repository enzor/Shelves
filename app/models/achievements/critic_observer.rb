class CriticObserver < ActiveRecord::Observer
  observe :comment
  
  def after_save(comment)
    Critic.award_achievements_for(comment.user) if (comment.user.comments.count > 0)
  end
  
  def after_update(comment)
    Critic.award_achievements_for(comment.user) if (comment.user.comments.count > 0)
  end
end