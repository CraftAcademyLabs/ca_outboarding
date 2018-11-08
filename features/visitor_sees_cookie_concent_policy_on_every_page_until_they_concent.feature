Feature: Show cookie concent policy until visitor concents 
    As a system owner
    In order to be (at least somewhat) GDPR compliant
    I would like to remind visitors to consent to cookie policy

    Scenario: Visitor can see and concent to usage of cookies 
    Given a visitor visits the site 
    Then he should see "Cookies help us deliver our services. By using our services, you agree to our use of cookies."
    And he clicks on "CraftEd"
    Then he should see "Cookies help us deliver our services. By using our services, you agree to our use of cookies."    
    And he clicks "OK" 
    Then he should not see "Cookies help us deliver our services. By using our services, you agree to our use of cookies."    
