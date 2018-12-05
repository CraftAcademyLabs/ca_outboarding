@javascript
Feature: Recruiter can search through members
    As a recruiter
    In order to find a suitable job candidate
    I would like to have a search function where I can search for: interest, tags, gender, location

Background:
    Given the following users exists
        | email                | first_name  | last_name | role      | gender | age |
        | alumni_1@craft.com   | Christopher | One       | member    | Male   | 34  |
        | alumni_2@craft.com   | Christina   | Two       | member    | Female | 19  |
        | coach_1@craft.com    | John        | Doe       | coach     | Male   |     |
        | recruiter@random.com | Recruiter   | Recruiter | recruiter |        |     |

Scenario: User searches for 'Chris' and gets two hits
    Given recruiter "recruiter@random.com" is logged in
    And I visit the site
    And fills in 'Search for members' with 'Chris'
    And I click 'Search'
    Then I should see 'Found 2 matches'
    Then stop
    And I should see 'Christopher'
    And I should see 'Christina'
    And I should not see 'John'