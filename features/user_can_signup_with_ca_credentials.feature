@javascript
Feature: User can signup using Craft Academy credentials
  As a User
  In order to have a unified experience
  I would like to be able to signup using my Craft Academy credentials

  Scenario: User signs up using CA credentials
    Given a visitor visits the site 
    When he clicks on "CraftEd"
    Then he should be redirected to craft oauth page
    And he should see "Successfully authenticated from CraftEd account."