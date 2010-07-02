Factory.define :user do |f|
  f.username "gigidag"
  f.password "foobar"
  f.password_confirmation "foobar"
  f.email "gigidag@foobar.it" 
end


Factory.define :book do |b|
  b.name "Mona Lisa Giveaway"
  b.description "Leonardo Goes Wild!He want to sell copies of mona liiiiiiisaaaaa! Someone stop him! NOW!"
  b.cover_photo "/public/images/commons/defcover.png"
end


Factory.define :comment do |c|
  c.author "gigidag"
  c.body "I want a copy of the Mona Lisa too!!!!Give me give me give me!"
end
