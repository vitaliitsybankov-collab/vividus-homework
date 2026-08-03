Description: Task 2.1 - Verify user registration is possible

Scenario: Verify a new user can register successfully
Given I initialize scenario variable `email` with value `#{generate(Internet.emailAddress)}`
Given I am on page with URL `https://demowebshop.tricentis.com/register`
When I click on element located by `id(gender-male)`
When I enter `John` in field located by `id(FirstName)`
When I enter `Doe` in field located by `id(LastName)`
When I enter `${email}` in field located by `id(Email)`
When I enter `Password123!` in field located by `id(Password)`
When I enter `Password123!` in field located by `id(ConfirmPassword)`
When I click on element located by `id(register-button)`
Then text `Your registration completed` exists
