@javascript
Feature: Recruiter can search through members
    As a recruiter
    In order to find a suitable job candidate
    I would like to have a search function where I can search for: interest, tags, gender, location

Background:
    Given the following users exists
        | email                | first_name  | last_name | role      | gender | age |
        | alumni_1@craft.com   | Christopher | Williams  | member    | Male   | 34  |
        | alumni_2@craft.com   | Jane        | Mustafa   | member    | Female | 20  |
        | coach_1@craft.com    | John        | Doe       | coach     | Male   |     |
        | recruiter@random.com | Recruiter   | Recruiter | recruiter |        |     |
    And recruiter "recruiter@random.com" is logged in
    And I visit the site

Scenario: User searches for 'Chris' and gets one hit
    And fills in 'Search for members' with 'Christopher'
    And I click 'Search'
    Then I should see 'Found 1 matching member'
    And I should see 'Christopher'
    And I should not see 'John'

Scenario: User searches for 'Mustafa' and gets one hit
    And fills in 'Search for members' with 'Mustafa'
    And I click 'Search'
    Then I should see 'Found 1 matching member'
    And I should see 'Mustafa'
    And I should not see 'Williams'

Scenario: User searches for 'Female' and gets one hit
    And fills in 'Search for members' with 'Female'
    And I click 'Search'
    Then I should see 'Found 1 matching member'
    And I should see 'Jane Mustafa'
    And I should see 'Gender: Female'

Scenario: User searches for '34' and gets one hit
    And fills in 'Search for members' with '34'
    And I click 'Search'
    Then I should see 'Found 1 matching member'
    And I should see 'Christopher Williams'
    And I should see 'Gender: Male'
    And I should see 'Age: 34'
    And I should not see 'Jane Mustafa'