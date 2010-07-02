class Critic < Achievement
  
  level 1, :quota => 5, :name => "First Comment"
  level 2, :quota => 10, :name => "Apprentice Critic"
  level 3, :quota => 30, :name => "Average Critic"
  level 4, :quota => 100, :name => "Good Critic"
  level 5, :quota => 500, :name => "Troll!"
  
  set_thing_to_check { |user| user.comments.count }


  def self.award_achievements_for(user)
    return unless user
    levels.each do |level|
      if !user.has_achievement?(self, level[:level]) and thing_to_check(user) >= level[:quota]
        user.award_achievement(self, level[:level])
        User.notify(user,level[:name])
      end
    end
  end

  
end