@javascript
Feature: Recruiter can purchase a subscription to gain access

    As a recruiter
    In order to view a detailed profile on a member (previous experience, personal details (but not name, address and email)
    I would like to become a paying subscriber



    Background:
        Given the following users exists
            | email                 | first_name  | last_name | role      | subscriber |
            | recruiter@random.com  | Recruiter   | Recruiter | recruiter | false      |
            | subscriber@random.com | Subscribing | Recruiter | recruiter | true       |
            | alumni_1@craft.com    | Student     | One       | member    |            |
            | alumni_2@craft.com    | Student     | Two       | member    |            |
            | alumni_3@craft.com    |             |           | member    |            |
            | coach_1@craft.com     | Head        | Coach     | coach     |            |

    Scenario: Recruiter that has NOT payed up tries to access site and is re-routed to payment form
        Given recruiter "recruiter@random.com" is logged in
        And he visits the site
        And clicks "View profile" on "alumni_1@craft.com"
        Then he should be on the profile page of "alumni_1@craft.com"
        And he should see "Student One"
        But he should not see "alumni_1@craft.com"
        And he should see "Purchase a subscription to see full member profile."
        And he should see a link "Learn more"

    Scenario: Recruiter that has already payed up should be granted access
        Given recruiter "subscriber@random.com" is logged in
        And he visits the site
        And clicks "View profile" on "alumni_1@craft.com"
        Then he should be on the profile page of "alumni_1@craft.com"
        And he should see "Student One"
        And he should see "alumni_1@craft.com"

    Scenario: Recruiter pays up and becomes a subscriber
        Given recruiter "recruiter@random.com" is logged in
        And he visits the site
        And clicks "View profile" on "alumni_1@craft.com"
        And clicks "Learn more"
        And clicks on 'Yes, I want to purchase a subscription'
        And he fill in and submit the stripe form with 'valid' credentials
        Then wait 4 seconds
        Then he should be redirected to index page
        And he should see "Welcome as a subscriber"

    @stripe_declined
    Scenario: Recruiter fails to pay up and we say "WTF?"
        Given recruiter "recruiter@random.com" is logged in
        And he visits the site
        And clicks "View profile" on "alumni_1@craft.com"
        And clicks "Learn more"
        And clicks on 'Yes, I want to purchase a subscription'
        And he fill in and submit the stripe form with 'invalid' credentials
        Then wait 6 seconds
        Then he should be on the subscription page
        And he should see "The card was declined"
