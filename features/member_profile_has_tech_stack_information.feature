Feature: Member profile has tech stack information

  As a Member
  In order to make my profile easier to find for Recruiters
  I would like to display my tech skills with proficiency levels

  Background: 

  Given the following user exists
      | email              | first_name | last_name | role   |
      | alumni_1@craft.com | Student    | One       | member |

  And he has the following skills listed
    | name            | proficiency  | of_type | user               |
    | Javascript      | junior       | Tech    | alumni_1@craft.com |
    | Ruby on Rails   | advanced     | Tech   | alumni_1@craft.com |
    | Team management | intermediate | Soft    | alumni_1@craft.com |


  And member "alumni_1@craft.com" is logged in

  Scenario: Member access his/hers profile and sees their skills being listed
    When a member visits the site
    And he clicks "View profile" on his listing
    Then he should see "Skills"
    And he should see "Javascript" in the "Tech" skills
    And he should see "Ruby on Rails" in the "Tech" skills
    And he should see "Team management" in the "Soft" skills
    And he should see "Proficiency: Junior" within "Javascript"
    And he should see "Proficiency: Advanced" within "Ruby on Rails"
    And he should see "Proficiency: intermediate" within "Team management"


