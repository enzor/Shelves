class Publisher < Achievement
  
  level 1, :quota => 1 , :name => "First Book"
  level 2, :quota => 3 , :name => "Apprentice Writer"
  level 3, :quota => 5 , :name => "Average Writer"
  level 4, :quota => 10, :name => "Good Writer"
  level 5, :quota => 20, :name => "Master Writer"
  
  set_thing_to_check { |user| user.books.count }

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