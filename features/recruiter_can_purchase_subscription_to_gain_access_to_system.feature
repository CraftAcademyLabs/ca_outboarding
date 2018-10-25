@javascript
Feature: Recruiter can purchase a subscription to gain access

    Feature Description



    Background:
        Given the following users exists
            | email                 | first_name  | last_name | role      | subscriber |
            | recruiter@random.com  | Recruiter   | Recruiter | recruiter | false      |
            | subscriber@random.com | Subscribing | Recruiter | recruiter | true       |


    Scenario: Recruiter that has NOT payed up tries to access site and is re-routed to payment form
        Given recruiter "recruiter@random.com" is logged in
        And he visits the site
        Then he should see "You are not authorized to enter, please purchase a subscription"
        And he should be on the subscription page

    Scenario: Recruiter that has already payed up should be granted access
        Given recruiter "subscriber@random.com" is logged in
        And he visits the site
        Then he should be redirected to index page

    Scenario: Recruiter pays up and becomes a subscriber
        Given recruiter "recruiter@random.com" is logged in
        And he visits the site
        And he fill in and submit the stripe form with 'valid' credentials
        Then wait 2 seconds
        Then he should be redirected to index page
        And he should see "Welcome as a subscriber"

    Scenario: Recruiter fails to pay up and we say "WTF?"
        Given recruiter "recruiter@random.com" is logged in
        And he visits the site
        And he fill in and submit the stripe form with 'invalid' credentials
        Then wait 2 seconds
        Then he should be on the subscription page
        And he should see "Your card was declined"
