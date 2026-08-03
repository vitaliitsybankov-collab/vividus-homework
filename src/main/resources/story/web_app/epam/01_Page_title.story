Description: Task 1.1 - Verify the page title

Scenario: Verify the page title of EPAM.com
Given I am on page with URL `https://www.epam.com`
Then page title is equal to `EPAM | Software Engineering & Product Development Services`
