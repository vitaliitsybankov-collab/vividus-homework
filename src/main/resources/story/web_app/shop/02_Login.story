Description: Task 2.2 - Verify user login is possible

Scenario: Register a user to be used for the login check
Given I initialize story variable `email` with value `#{generate(Internet.emailAddress)}`
Given I am on page with URL `https://demowebshop.tricentis.com/register`
When I click on element located by `id(gender-male)`
When I enter `Jane` in field located by `id(FirstName)`
When I enter `Roe` in field located by `id(LastName)`
When I enter `${email}` in field located by `id(Email)`
When I enter `Password123!` in field located by `id(Password)`
When I enter `Password123!` in field located by `id(ConfirmPassword)`
When I click on element located by `id(register-button)`
Then text `Your registration completed` exists
When I click on element located by `linkText(Log out)`

Scenario: Verify login with the registered account
Given I am on page with URL `https://demowebshop.tricentis.com/login`
When I enter `${email}` in field located by `id(Email)`
When I enter `Password123!` in field located by `id(Password)`
When I click on element located by `xpath((//input[@type='submit'])[1])`
Then number of elements found by `linkText(Log out)` is greater than or equal to `1`
