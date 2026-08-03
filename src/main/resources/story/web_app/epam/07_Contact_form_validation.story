Description: Task 1.7 - Verify form field validation on the Contact page

Scenario: Verify required fields are validated when submitting an empty contact form
Given I am on page with URL `https://www.epam.com/about/who-we-are/contact`
When I click on element located by `xpath(//button[@type='submit'])`
Then number of elements found by `xpath(//*[contains(@class,'error') or contains(@class,'invalid')])` is greater than or equal to `1`
