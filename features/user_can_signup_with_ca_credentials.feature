@javascript
Feature: User can signup using Craft Academy credentials
  As a User
  In order to have a unified experience
  I would like to be able to signup using my Craft Academy credentials

  Scenario: User signs up using CA credentials
    Given a visitor visits the site 
    And he clicks on "Sign Up with CA"
    And he fills in "Email" with "tochman"
    And he fills in "Password" with "password"
    When he clicks on "Sign Up"
    Then he should be redirected to index page
    And he should see "Successfully signed up from Craft Academy account"