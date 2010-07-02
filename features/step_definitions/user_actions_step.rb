Given /^a valid user$/ do
  @user = Factory.create(:user)
end


Given /^a logged in user$/ do
  visit user_login_path
  fill_in "user_session_username", :with => "gigidag"
  fill_in"user_session_password", :with => "foobar"
  click_button "Login"
end



Given /^a valid comment$/ do
  @comment = Factory.create(:comment, :user_id => @user.id )
end

