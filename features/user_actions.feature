Feature: User Actions
	In order to verify the behaviour
	As a user
	I want to register, login,logout, create a comment, delete the comment.
	
	Background:
		Given a valid user

	Scenario: Successful Register
	  Given I go to the home page
	  When I follow "Register" 
	  And I fill in "Username" with "EnzoRivello"
	  And I fill in "Email" with "darthpando@gmail.com"
	  And I fill in "Password" with "pippospazio"
	  And I fill in "Password Confirmation" with "pippospazio"
	  And I press "Create"
	  Then I should see "Logout" 
	

	Scenario: Successful Login
	  Given a logged in user
	  When I go to the home page
	  Then I should see "Logout"
	
	@wip
	Scenario: Successful comment creation, and editing
	  Given a logged in user
	  Given a valid book
	  When  I go to the home page
	  And I follow "Mona Lisa Giveaway"
	  Then I should see "Mona Lisa Giveaway"
	  And I should see "gigidag"
	  And I fill in "Description" with "Someone stop leonaaaardoooo i want my monalisa!"
	  And I press "Create"
	  Then I should see "Someone stop leonaaaardoooo i want my monalisa!"
	  And I follow "Edit Comment"
	  And I fill in "Description" with "Ahahahahahahaha"
	  And I press "Update"
	  Then I should see "Ahahahahahahaha"
	  And I follow "Delete Comment"
	  Then I should not see "Ahahahahahahaha"

	

	
	

	
	
	
	
	