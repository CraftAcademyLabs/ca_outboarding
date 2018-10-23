Feature: User can log in using LinkedIn
    As a user of the system
    In order to simplify the sign up/sign in process 
    I would like to be able to authenticate myself with LinkedIn

Scenario: Visitor clicks on 'Login with LinkedIn' and gets authenticated
    When I visit the site
    And clicks on "Login with LinkedIn"
    Then I should be redirected to index page
    And he should see "Successfully authenticated from LinkedIn account"

Scenario: LinkedIn authentication fails
    Given the LinkedIn authentication is not granted
    And I visit the site
    And clicks on "Login with LinkedIn"
    Then I should be redirected to index page
    And he should see "Could not authenticate you!"