@javascript
Feature: Member profiles are displayed on index page

    As a visitor
    In order to be able to browse through Member profiles
    I would like to be able to see a paginated collection of member profiles on the index page of the platform


    Background:
        Given the following users exists
            | email              | first_name | last_name |
            | alumni_1@craft.com | Student    | One       |
            | alumni_2@craft.com | Student    | Two       |
            | alumni_3@craft.com | Student    | Three     |


    Scenario: Member profiles are displayed on index page
        When a visitor visits the site
        Then he should see "Student One" in "members" section
        And he should see "Student Two" in "members" section
        And he should see "Student Three" in "members" section