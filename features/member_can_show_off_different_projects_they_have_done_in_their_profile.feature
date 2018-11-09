Feature: Member can show off different projects they have done in their profile

  As a member
  In order to show recruiters my coding skills
  I would like to be able to list previous projects I've worked on

  Background:
    Given the following user exists
      | email              | first_name | last_name | role   |
      | alumni_1@craft.com | Student    | One       | member |

    And he has the following projects
      | description           | url                                                    | type    | user               |
      | My fizz buzz solution | https://github.com/Prozak8/Fizz_Buzz                   | repo    | alumni_1@craft.com |
      | My address book       | https://rhongabriel.github.io/address_book//index.html | website | alumni_1@craft.com |


    And member "alumni_1@craft.com" is logged in
    
  Scenario: Members previous projects are listed on his/hers profile page
    When a member visits the site
    And he clicks "View profile" on his listing
    Then he should see "My fizz buzz solution"
    And he should see "My address book"
