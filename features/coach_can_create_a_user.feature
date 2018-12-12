@javascript @search
Feature: Coach can create a user (member)

    Feature Description

    Background:
        Given the following users exists
            | email             | first_name | last_name | role  |
            | coach_1@craft.com | Coach      | One       | coach |

        And coach "coach_1@craft.com" is logged in

    Scenario: Coach visits admin interface and creates a user with valid info
        Given he visits the admin page
        And click on "Add Member"
        And fills in "Email" with "new_member@craft.com"
        And fills in "First name" with "New"
        And fills in "Last name" with "Member"
        And he clicks on "Create member"
        Then he should be on the admin page
        And he should see "A new user has been created"