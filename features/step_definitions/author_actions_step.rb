Given /^a valid author$/ do
  @user = Factory.create(:user,:roles_mask => 2)
end


Given /^a logged in author$/ do
  visit user_login_path
  fill_in "user_session_username", :with => "gigidag"
  fill_in"user_session_password", :with => "foobar"
  click_button "Login"
end

Given /^a valid book$/ do
  @book = Factory.create(:book, :user_id => @user.id )
end
