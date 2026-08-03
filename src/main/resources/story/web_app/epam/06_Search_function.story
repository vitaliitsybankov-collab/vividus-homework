Description: Task 1.6 - Verify the search function

Scenario: Verify search returns relevant results for query "AI"
Given I am on page with URL `https://www.epam.com`
When I click on element located by `xpath(//button[contains(@aria-label,'Search') or contains(@class,'search')])`
When I enter `AI` in field located by `xpath(//input[@type='search' or contains(@placeholder,'Search')])`
Then text `AI` exists
