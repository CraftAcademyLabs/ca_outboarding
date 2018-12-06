@javascript
Feature: Recruiter can search through members
    As a recruiter
    In order to find a suitable job candidate
    I would like to have a search function where I can search for: interest, tags, gender, location

Background:
    Given the following users exists
        | email                | first_name  | last_name | role      | gender | age |
        | alumni_1@craft.com   | Chris       | One       | member    | Male   | 34  |
        | alumni_2@craft.com   | Christina   | Two       | member    | Female | 19  |
        | alumni_3@craft.com   | Katheryn    | Twval     | member    | Female | 24  |
        | coach_1@craft.com    | John        | Doe       | coach     | Male   |     |
        | recruiter@random.com | Recruiter   | Recruiter | recruiter |        |     |

Scenario: User searches for 'Chris' and gets one hit
    Given recruiter "recruiter@random.com" is logged in
    And I visit the site
    And fills in 'Search for members' with 'Chris'
    And I click 'Search'
    Then I should see 'Found 1 matches'
    And I should see 'Chris'
    And I should not see 'John'

Scenario: User searches for 'Christina Two' and gets one hit
    Given recruiter "recruiter@random.com" is logged in
    And I visit the site
    And fills in 'Search for members' with 'Two'
    And I click 'Search'
    Then I should see 'Found 1 matches'
    And I should see 'Christina Two'
    And I should not see 'Chris'