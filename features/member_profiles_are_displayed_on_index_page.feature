@javascript
Feature: Member profiles are displayed on index page

    As a visitor
    In order to be able to browse through Member profiles
    I would like to be able to see a paginated collection of member profiles on the index page of the platform


    Background:
        Given the following users exists
            | email              | first_name | last_name | role   | gender | age |
            | alumni_1@craft.com | Student    | One       | member | Male   | 34  |
            | alumni_2@craft.com | Student    | Two       | member | Female | 19  |
            | alumni_3@craft.com |            |           | member | Male   |     |
            | coach_1@craft.com  | Head       | Coach     | coach  | Female |     |

        And member "alumni_1@craft.com" is logged in


    Scenario: Member profiles are displayed on index page
        When a visitor visits the site  
        Then he should see "Student One" in "members" section
        And he should see "Student Two" in "members" section
        And he should see "alumni_3@craft.com" in "members" section
        And he should see "Female"
        And he should see "Male"
        And he should see "Age: 34"
        And he should see "Age: 19"
        And he should not see "Head Coach" in "members" section

