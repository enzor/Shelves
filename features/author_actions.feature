Feature: Author actions
  In order to create books
  As an author
  I want to be capable to login as an author, create books and remove books


Background:
  Given a valid author


Scenario: Succesful Login as an Author
  Given a logged in author
  Then I should see "New Book"



Scenario: Successful create a book
  Given a logged in author
  When I follow "New Book"
  And I fill in "Title" with "Mona Lisa Giveaway"
  And I fill in "Description" with "Leonardo goes wild!He wants to sell all his monalisas! Stop him!"
  And I press "Create"
  Then I should see "Mona Lisa Giveaway"


Scenario: Successful edit a book
  Given a logged in author
  Given a valid book
  When I go to the home page
  Then I should see "Mona Lisa Giveaway"
  When I follow "Edit"
  And I fill in "Description" with "More mona lisa more more more"
  And I press "Update"
  Then I should see "More mona lisa more more more"


Scenario: Successful destroy a book
  Given a logged in author
  Given a valid book
  When I go to the home page
  Then I should see "Mona Lisa Giveaway"
  And I follow "Mona Lisa Giveaway"
  And I should see "Destroy"
  When I follow "Destroy"
  Then I should see "Book was successfully destroyed."





	

  
