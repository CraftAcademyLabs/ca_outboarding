Feature: Visitor can see basic marketing information
  As a system owner
  In order to help our visitors to understand the benefits of Craft Academy and navigate through our offerings
  I would like them to see a basic introduction to Craft Academy

  Scenario: Visitor sees the about us page
    Given a visitor visits the site
    And he clicks on "About Us"
    Then he should be on the about us page
    And he should see the about us information

