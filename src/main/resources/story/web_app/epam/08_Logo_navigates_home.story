Description: Task 1.8 - Verify that the company logo in the header leads to the main page

Scenario: Verify clicking the header logo navigates to the main page
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `xpath(//header//a[contains(@class,'logo') or contains(@aria-label,'EPAM') or @href='/'])`
Then `${current-page-url}` is equal to `https://www.epam.com/`
