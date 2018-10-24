@javascript
Feature: Member can add avatar to own profile

    As a Member,
    In order to make my profile more attractive
    I would like to be able to add an avatar to my account

    Background:
        Given the following users exists
            | email              | first_name | last_name | role   |
            | alumni_1@craft.com | Student    | One       | member |
            | alumni_2@craft.com | Student    | Two       | member |

        And member "alumni_1@craft.com" is logged in


    Scenario: Member can edit own profile and add an avatar
        When a member visits the site
        And clicks "View profile" on his listing
        And clicks on "Edit"
        And attaches "dummy_avatar.png"
        And clicks on "Update"
        Then he should be on his profile page
        And he should see "dummy_avatar.png" image


    Scenario: Member tries to add a pdf dodument
        When a member visits the site
        And clicks "View profile" on his listing
        And clicks on "Edit"
        And attaches "sample.pdf"
        And clicks on "Update"
        Then he should see "We could not save your updates. Avatar needs to be an image"
