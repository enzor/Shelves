class Famous < Achievement
  
   level 1, :quota => 1, :name => "Someone loves me!"
   level 2, :quota => 5, :name => "Acquietance of mine"
   level 3, :quota => 10, :name => "Community Guy"
   level 4, :quota => 20, :name => "Important Person"
   level 5, :quota => 50, :name => "V.I.P"

  
  set_thing_to_check { |user| user.reverse_friends.count }


  

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