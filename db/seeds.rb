require 'faker'

# Book Categories

categories = ["General","Adventure","Horror","Humor","Literature","Mystery",
         "Romance","SciFi", "Fantasy","Suspense","Young","Adult"]
        
categories.each do |b|
  Category.create!(
            :name => b
            )
end

#Admin User
User.create!(:username => "admin", 
             :email => "enzor@sefitalia.com", 
             :password => "pippospazio", 
             :password_confirmation => "pippospazio", 
             :roles_mask => 1,
             :categories => Category.all(:order => "random()",:limit => 3)
             )




